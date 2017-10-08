class RacesController < ApplicationController

  #include Secured

  before_action :set_fleet, only: [:index, :create]
  before_action :set_race, only: [:show, :update, :destroy]
  #after_action :pubnub

  def index
    json_response(@fleet.races)
  end

  def open
    races = Race.where(aasm_state: [:announced, :scheduled, :in_progress, :postponed, :individual_recall, :general_recall, :cancelled])
    #races = Race.all
    render json: races, each_serializer: Race2Serializer
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

    @race.started_at = nil if @race.aasm_state == 'cancelled'
    @race.save!

    json_response(@race)
  end

  def

  def destroy
    @race.destroy
    head :no_content
  end

  private

  def race_params
    params.permit(:name, :race_type, :race_order, :final, :aasm_state, :scheduled_for, :started_at)
  end

  def set_fleet
    @fleet = Fleet.find(params[:fleet_id])
  end

  def set_race
    @race = Race.find_by!(id: params[:id]) 
  end

  def pubnub

    mypubnub.publish(
      channel: "races-#{@race.id}",
      message: @race
    ) do |envelope|
      puts envelope.status
    end

  end

end
