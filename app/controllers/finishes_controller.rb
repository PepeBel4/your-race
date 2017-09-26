class FinishesController < ApplicationController
  before_action :set_metric
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

  def create
    @finish = Finish.create
    @finish.metric = @metric
    @finish.race_competitor = RaceCompetitor.find_by(id: params[:race_competitor_id])
    @finish.timestamp=Time.now if !@finish.timestamp
    @finish.update(finish_params)
    update_positions
    json_response(@metric, :created)
  end

  # PUT /competitions/:competition_id/races/:id
  #def update
  #  @race.update(race_params)
  #  head :no_content
  #end

  # DELETE /competitions/:competition_id/races/:id
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
