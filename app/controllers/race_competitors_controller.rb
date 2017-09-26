class RaceCompetitorsController < ApplicationController
  before_action :set_race
  before_action :set_race_competitor, only: [:show, :update, :destroy]

  # GET /race_competitors
  def index
    @race_competitors = RaceCompetitor.all

    render json: @race_competitors
  end

  # GET /race_competitors/1
  def show
    render json: @race_competitor
  end

  # POST /race_competitors
  def create
    @race_competitor = RaceCompetitor.new
    @race_competitor.race = @race
    @race_competitor.update(race_competitor_params)

    if @race_competitor.save
      render json: @race_competitor, status: :created, location: @race_competitor
    else
      render json: @race_competitor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /race_competitors/1
  def update
    if @race_competitor.update(race_competitor_params)
      render json: @race_competitor
    else
      render json: @race_competitor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /race_competitors/1
  def destroy
    @race_competitor.destroy
  end

  private
    def set_race
      @race = Race.find(params[:race_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_race_competitor
      @race_competitor = RaceCompetitor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def race_competitor_params
      params.require(:race_competitor).permit(:race_competitor_id)
    end
end
