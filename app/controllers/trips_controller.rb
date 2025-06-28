class TripsController < ApplicationController
  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      render json: @trip, status: :created
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  private


  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(
      :start_date,
      :end_date,
      :origin,
      :destination,
      :status,
      :driver_id,
      :vehicle_id,
      )
  end
end
