class ScoringsController < ApplicationController
  before_action :set_group
  before_action :set_scoring, only: [:show, :update, :destroy]

  def index
    @scorings = Scoring.all

    render json: @scorings
  end

  def show
    render json: @scoring
  end

  def create
    @scoring = Scoring.new
    @scoring.group = @group
    @scoring.update(scoring_params)

    if @scoring.save
      json_response(@scoring, :created)
    else
      render json: @scoring.errors, status: :unprocessable_entity
    end
  end

  def testing

    scoring = Scoring.where(group_id: params[:group_id])
    scoring.find_each do |s|
      #find the good RaceScoring
      #race = Race.find_by(race_id: s.race_id, metric_type: 'Finish')
      race_scoring = RaceScoring.find_by(race_competitor: s.competitor.race_competitors)
      s.race_positions.insert(race_scoring.race.race_order-1,race_scoring.points) if race_scoring  
      s.points = race_scoring.points if race_scoring
      s.points_with_discards = s.points
      s.save!
    
      s.discards = 0
      s.save!
    end
    render json: scoring
  end

  def update
    if @scoring.update(scoring_params)
      render json: @scoring
    else
      render json: @scoring.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @scoring.destroy
  end

  private
    def set_group
      @group = Group.find(params[:group_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_scoring
      @scoring = Scoring.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scoring_params
      params.require(:scoring).permit(:points, :discards, :points_with_discards, :group_id, :competitor_id)
    end
end
