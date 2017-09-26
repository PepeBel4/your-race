class FleetsController < ApplicationController
  before_action :set_group
  before_action :set_fleet, only: [:show, :update, :destroy]

  def index
    @fleets = Fleet.all

    render json: @fleets
  end

  def show
    render json: @fleet
  end

  def create
    @fleet = Fleet.new
    @fleet.group = @group
    @fleet.update(fleet_params)
    
    if @fleet.save
      render json: @fleet, status: :created, location: @fleet
    else
      render json: @fleet.errors, status: :unprocessable_entity
    end
  end

  def update
    if @fleet.update(fleet_params)
      render json: @fleet
    else
      render json: @fleet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @fleet.destroy
  end

  private
    def set_group
      @group = Group.find(params[:group_id])
    # Use callbacks to share common setup or constraints between actions.
    end

    def set_fleet
      @fleet = Fleet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fleet_params
      params.require(:fleet).permit(:name, :fleet_type, :group_id)
    end
end
