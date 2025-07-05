module Api
  module V1
    class DriversController < ApplicationController
        before_action :set_driver, only: [ :show, :update, :destroy ]

        def index
          @drivers = Driver.all
          render json: @drivers
        end

        def create
          @driver = Driver.new(driver_params)
          if @driver.save
            render json: @driver, status: :created
          else
            render json: @driver.errors, status: :unprocessable_entity
          end
        end

          def show
            render json: @driver
          end

        def update
          if @driver.update(driver_params)
            render json: @driver
          else
            render json: @driver.errors, status: :unprocessable_entity
          end
        end

        def destroy
          @driver.destroy
          head :no_content
        end

        private

        def set_driver
          @driver = Driver.find(params[:id])
        end

        def driver_params
          params.require(:driver).permit(:name, :cpf, :cnh, :phone)
        end
    end
  end
end
