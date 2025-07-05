require 'rails_helper'


RSpec.describe "Vehicles Models", type: :model do
    it "should create a vehicle with all attributes" do
      vehicle = create(:vehicle)
      expect(vehicle).to be_valid
    end

    it "should filter a vehicle by status" do
      vehicle = create(:vehicle)
      create(:vehicle, status: "manutencao")
      filtered_vehicle  = Vehicle.filtered_vehicles(status: vehicle.status)
      expect(filtered_vehicle).to include(vehicle)
    end

    it "should filter a vehicle by brand" do
      create(:vehicle, brand: "toyota")
      vehicle_ford = create(:vehicle, brand: "ford")
      filtered_vehicles = Vehicle.filtered_vehicles(brand: "ford")
      expect(filtered_vehicles).to include(vehicle_ford)
    end

    it "should filter a vehicle by year" do
      create(:vehicle, year: "2020")
      vehicle_ford = create(:vehicle,  year: "2021")
      filtered_vehicles = Vehicle.filtered_vehicles(year: "2021")
      expect(filtered_vehicles).to include(vehicle_ford)
    end


    context "Validations" do
      it "does not allow blank plate" do
        vehicle = build(:vehicle, plate: "")
        expect(vehicle).to_not be_valid
      end

      it "does not allow blank brand" do
        vehicle = build(:vehicle, brand: "")
        expect(vehicle).to_not be_valid
      end

      it "does not allow blank year" do
        vehicle = build(:vehicle, year: "")
        expect(vehicle).to_not be_valid
      end

      it "does not allow blank year" do
        vehicle = build(:vehicle, status: "")
        expect(vehicle).to_not be_valid
      end

      it "does not allow blank fleet" do
        vehicle = build(:vehicle, fleet: nil)
        expect(vehicle).to_not be_valid
      end
    end
end
