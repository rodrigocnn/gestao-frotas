module Api
  module V1
    class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [ :show, :update, :destroy ]
# before_action :authenticate_user!, only: [ :create, :update, :destroy ]

# GET /vehicles
def index
  @vehicles = Vehicle.filtered_vehicles(
    status: params[:status],
    brand: params[:brand],
    year: params[:year]
  )
 render json: @vehicles, each_serializer: VehicleSerializer
end

  # GET /vehicles/:id
  def show
    render json: @vehicle
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      render json: @vehicle, status: :created
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicles/:id
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/:id
  def destroy
    @vehicle.destroy
    head :no_content
  end

  # GET /vehicles/available_plates
  def available_plates
    @plates = Vehicle.where(status: :disponivel).pluck(:plate)
    render json: @plates
  end



  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:plate, :brand, :model, :year, :status, :fleet_id)
  end
    end
  end
end
