class DeviceCoordinatesController < ApplicationController
  before_action :set_device_coordinate, only: [:show, :update, :destroy]

  # GET /device_coordinates
  def index
    @device_coordinates = DeviceCoordinate.all

    render json: @device_coordinates
  end

  # GET /device_coordinates/1
  def show
    render json: @device_coordinate
  end

  # POST /device_coordinates
  def create
    @device_coordinate = DeviceCoordinate.new(device_coordinate_params)

    if @device_coordinate.save
      render json: @device_coordinate, status: :created, location: @device_coordinate
    else
      render json: @device_coordinate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /device_coordinates/1
  def update
    if @device_coordinate.update(device_coordinate_params)
      render json: @device_coordinate
    else
      render json: @device_coordinate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /device_coordinates/1
  def destroy
    @device_coordinate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_coordinate
      @device_coordinate = DeviceCoordinate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def device_coordinate_params
      params.require(:device_coordinate).permit(:device_id, :timestamp, :latitude, :longitude)
    end
end
