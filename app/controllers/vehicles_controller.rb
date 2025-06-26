class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
    @vehicles = @vehicles.filter_by_status(params[:status]) if params[:status].present?
    render json: @vehicles
  end
end
