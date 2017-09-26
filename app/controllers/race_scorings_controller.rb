class RaceScoringsController < ApplicationController
  before_action :set_race_scoring, only: [:show, :update, :destroy]

  # GET /race_scorings
  def index
    @race_scorings = RaceScoring.all
    render json: @race_scorings
  end

  # GET /race_scorings/1
  def show
    render json: @race_scoring
  end

  # POST /race_scorings
  def create
    @race_scoring = RaceScoring.new(race_scoring_params)

    if @race_scoring.save
      render json: @race_scoring, status: :created, location: @race_scoring
    else
      render json: @race_scoring.errors, status: :unprocessable_entity
    end
  end

  def testing
    race_scoring = RaceScoring.where(race_id: params[:race_id])
    race_scoring.find_each do |s|
      #find the good finish
      metric = Metric.find_by(race_id: s.race_id, metric_type: 'Finish')
      finish = Finish.find_by(metric: metric,race_competitor: s.race_competitor)
      
      s.position = finish.position if finish
      s.points = finish.position if finish
      s.comments = '' if finish

      s.comments = 'DNF' if !finish
      s.points = race_scoring.size if !finish

      s.save!
    end
    render json: race_scoring
  end

  # PATCH/PUT /race_scorings/1
  def update
    if @race_scoring.update(race_scoring_params)
      render json: @race_scoring
    else
      render json: @race_scoring.errors, status: :unprocessable_entity
    end
  end

  # DELETE /race_scorings/1
  def destroy
    @race_scoring.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_race_scoring
      @race_scoring = RaceScoring.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def race_scoring_params
      params.require(:race_scoring).permit(:race_competitor_id, :race_id, :position, :points, :comments)
    end
end
