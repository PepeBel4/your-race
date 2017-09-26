class RacesController < ApplicationController
  before_action :set_fleet
  before_action :set_race, only: [:show, :update, :destroy]

  def index
    json_response(@fleet.races)
  end

  def show
    json_response(@race)
  end

  def create
    @fleet.races.create!(race_params)
    json_response(@fleet, :created)
  end

  def update
    @race.update(race_params)
    head :no_content
  end

  def destroy
    @race.destroy
    head :no_content
  end

  private

  def race_params
    params.require(:race_order).permit(:name, :race_type, :final)
  end

  def set_fleet
    @fleet = Fleet.find(params[:fleet_id])
  end

  def set_race
    @race = @fleet.races.find_by!(id: params[:id]) if @fleet
  end
end
