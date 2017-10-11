class FinishesController < ApplicationController
  before_action :set_metric, except: [:register]
  before_action :set_finish, only: [:show, :update, :destroy]

  def update_positions
      position = 1
      Finish.where(metric_id: @finish.metric_id).find_each do |finish|
        finish.position = position
        finish.save!
        position += 1
      end
  end

  def index
    #json_response(@metric.finishes)
    render json: @metric.finishes
  end

  def show
    json_response(@metric)
  end

  def register
    
    #we have a competitor, we now which races he has joined, let's list them
    competitor_id = params[:id]
    competitor = Competitor.find(competitor_id)
    
    competitor.race_competitors.each do |race_competitor|
      p "Competitor racing in race : #{race_competitor.race_id}"
      #let's get some data from this race
      race = Race.find(race_competitor.race_id)
      p "This is the race: #{race.name}"
      p "Status:#{race.aasm_state}"
      if race.inProgress?
        #finish this competitor!
        @finish = Finish.create
        #still hardcoded, needs to be changed!
        @finish.metric = Metric.find(4)
        @finish.race_competitor = race_competitor
        @finish.timestamp = params[:timestamp]
        @finish.save!
        update_positions
        @finish = Finish.find(@finish.id)
      end
    end

    render json: @finish
  end

  def create
    @finish = Finish.create
    @finish.metric = @metric
    @finish.race_competitor = RaceCompetitor.find_by(id: params[:race_competitor_id])
    @finish.timestamp=Time.now if !@finish.timestamp
    @finish.update(finish_params)
    update_positions
    json_response(@metric, :created)
  end

  #def update
  #  @race.update(race_params)
  #  head :no_content
  #end

  #def destroy
  #  @race.destroy
  #  head :no_content
  #end

  private

  def finish_params
    params.permit(:timestamp)
  end

  def set_metric
    @metric = Metric.find(params[:metric_id])
  end

  def set_finish
    @finish = @metric.finishes.find_by!(id: params[:id]) if @race
  end
end
