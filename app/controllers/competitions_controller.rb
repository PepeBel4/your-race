class CompetitionsController < ApplicationController
  #include Secured

  before_action :set_competition, only: [:show, :update, :destroy]

  # GET /
  def index
    @competitions = Competition.all
    #@competitions = Competition.where(created_by: @user).order('created_at DESC').page params[:page]
    #json_response(@competitions)
    render json: @competitions
  end

  # POST /competitions
  def create
    @competition = Competition.create!(competition_params)
    json_response(@competition, :created)
  end

  # GET /competitions/:id
  def show
    #json_response(@competition)
    render json: @competition
  end

  # PUT /competitions/:id
  def update
    @competition.update(competition_params)
    head :no_content
  end

  # DELETE /competitions/:id
  def destroy
    @competition.destroy
    head :no_content
  end

  private

  def competition_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_competition
    @competition = Competition.find(params[:id])
  end
end
