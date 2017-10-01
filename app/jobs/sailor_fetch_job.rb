class SailorFetchJob < ApplicationJob

  def perform(competitor_id)
    competitor = Competitor.find_by_id(competitor_id)
    return if competitor.nil? || competitor.sailor_id.nil?
    log = Logger.new('log/sailor_fetch_job.log')

    begin
      doc = Nokogiri::HTML(open('https://members.sailing.org/sailors/biog.php?id=' + competitor.sailor_id))
      sailor = competitor.sailor || competitor.build_sailor

      matchings = {
        first_name:                 '#biogfirstname span.uneditable',
        last_name:                  '#biogsurname span.uneditable',
        nickname:                   '#biognickname span.uneditable',
        country:                    '#biognationality span.uneditable',
        resident_country:           '#residence span.uneditable',
        hometown:                   '#Hometown span.uneditable',
        gender:                     '#bioggender span.uneditable',
        birthday:                   '#biogdob span.uneditable',
        classification:             '#biogclassification span.static',
        classification_expiry_date: '#biogclassificationdate span.static',
        marital:                    '#marital span.uneditable',
        children:                   '#Children span.uneditable',
        occupation:                 '#Occupation span.uneditable',
        yatch_club:                 '#Yacht span.uneditable',
        yatch_club_location:        '#YachtClub span.uneditable',
        coach:                      '#Coach span.uneditable',
        coached_since:              '#Coachsince span.uneditable',
        languages:                  '#Languages span.uneditable',
        education:                  '#Education span.uneditable',
        campaign_website:           '#Campaign span.uneditable',
        email:                      '#Email span.uneditable',
        first_boat_sailed:          '#FirstBoatSailed span.uneditable',
        start_sailing_at_age:       '#Started span.uneditable',
        start_racing_at_age:        '#racing span.uneditable',
        current_classes_sailed:     '#CurrentClassesSailed span.uneditable',
        previous_classes_sailed:    '#PreviousClassesSailed span.uneditable',
        first_event:                '#FirstEvent span.uneditable',
        first_event_won:            '#eventwon span.uneditable'
      }

      sailor.avatar_remote_url = doc.css('.sailorimage img').first.attr('src')
      sailor.avatar            = URI.parse(sailor.avatar_remote_url)
      sailor.member_id         = doc.css('input[name=MemberId]').first.attr('value')

      matchings.keys.each do |key|
        sailor[key] = doc.css(matchings[key]).first.content.strip
      end

      sailor.save
      log.info "Sailor saved: #{sailor.id}"
    rescue Exception => e
      log.info "Error: `#{e.message}` when trying to fetching `#{competitor.sailor_id}`(#{competitor.id})"
    end
  end

end
