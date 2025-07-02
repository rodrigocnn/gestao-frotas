module Api
  module V1
    class FleetsController < ApplicationController
      before_action :set_fleet, only: [ :show, :update, :destroy ]

      def index
        @fleets = Fleet.all
        render json: @fleets
      end

      def show
        render json: @fleet
      end

      def create
        @fleet = Fleet.new(fleet_params)
        if @fleet.save
          render json: @fleet, status: :created
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
      head :no_content
      end

      def get_all_vehicles_by_fleet
        fleets = Fleet.includes(:vehicles).all
        render json: fleets.to_json(include: :vehicles)
      end

      private

      def set_fleet
        @fleet = Fleet.find(params[:id])
      end

      def fleet_params
        params.require(:fleet).permit(:name, :responsible)
      end
    end
  end
end
