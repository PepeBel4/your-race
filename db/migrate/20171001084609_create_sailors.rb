class CreateSailors < ActiveRecord::Migration[5.1]
  def change
    create_table :sailors do |t|
      t.integer    :member_id
      t.string     :first_name
      t.string     :last_name
      t.string     :nickname
      t.string     :country
      t.string     :resident_country
      t.string     :hometown
      t.string     :gender
      t.date       :birthday
      t.string     :classification
      t.date       :classification_expiry_date
      t.string     :marital
      t.integer    :children
      t.string     :occupation
      t.string     :yatch_club
      t.string     :yatch_club_location
      t.string     :coach
      t.string     :coached_since
      t.string     :languages
      t.string     :education
      t.string     :campaign_website
      t.string     :email
      t.string     :first_boat_sailed
      t.string     :start_sailing_at_age
      t.string     :start_racing_at_age
      t.string     :current_classes_sailed
      t.string     :previous_classes_sailed
      t.string     :first_event
      t.string     :first_event_won
      t.string     :avatar_remote_url
      t.attachment :avatar
      t.references :competitor, foreign_key: true

      t.timestamps
    end
  end
end
