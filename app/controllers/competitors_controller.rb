class CompetitorsController < ApplicationController
  before_action :set_group, except: [:for_competition]
  before_action :set_competitor, only: [:show, :update, :destroy]

  def index
    #json_response(@competition.competitors)
    render json: @group.competitors
  end

  def for_competition
    competitors = Competitor.all
    render json: competitors
  end

  def show
    json_response(@competitor)
  end

  def create
    @competitor = Competitor.create
    @competitor.group = @group
    @competitor.update(competitor_params)
    
    #@competitor.save!
    json_response(@competitor, :created)
  
  end

  def update
    @competitor.update(competitor_params)
    head :no_content
  end

  def destroy
    @competitor.destroy
    head :no_content
  end

  private

  def competitor_params
    params.permit(:number,:name,:country,:sailor_id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_competitor
    @competitor = @group.competitors.find_by!(id: params[:id]) if @group
  end
end
