class MetricsController < ApplicationController
  before_action :set_race
  before_action :set_metric, only: [:show, :update, :destroy]

  def index
    json_response(@race.metrics)
  end

  def show
    json_response(@metric)
  end

  def create
    @race.metrics.create!(metric_params)
    json_response(@race, :created)
  end

  def update
    @metric.update(metric_params)
    head :no_content
  end

  def destroy
    @metric.destroy
    head :no_content
  end

  private

  def metric_params
    params.permit(:name, :metric_order, :metric_type)
  end

  def set_race
    @race = Race.find(params[:race_id])
  end

  def set_metric
    @metric = @race.metrics.find_by!(id: params[:id]) if @race
  end
end
