require 'rails_helper'

RSpec.describe "Vehicles API", type: :request do
  describe "GET /vehicles" do
    before do
      fleet = Fleet.create!(name: "Frota X")

      Vehicle.create!(
            plate: "ABC1234",
            brand: "Toyota",
            model: "Corolla",
            year: 2022,
            status: "disponivel",
            fleet: fleet
          )

          Vehicle.create!(
            plate: "XYZ5678",
            brand: "Honda",
            model: "Civic",
            year: 2021,
            status: "em_uso",
            fleet: fleet
          )
    end

    it "returns a list of vehicles" do
      get "/api/v1/vehicles"

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)
      expect(json).to be_an(Array)
      expect(json.size).to eq(2)
      expect(json[0]).to include("brand" => "Toyota")
    end
    it "should create a new vehicle correctly" do
      fleet = Fleet.create!(name: "Frota Y")

      post "/api/v1/vehicles", params: {
        vehicle: {
          plate: "XYZ5644",
          brand: "Toyota",
          model: "Corola",
          year: 2021,
          status: "em_uso",
          fleet_id: fleet.id
        }
      }

      expect(response).to have_http_status(:created)

      json = JSON.parse(response.body)
      expect(json["brand"]).to eq("Toyota")
      expect(json["plate"]).to eq("XYZ5644")
    end

    it "should put a new vehicle correctly" do
      fleet = Fleet.create!(name: "Frota Y")
      @vehicle = create(:vehicle)

      put "/api/v1/vehicles/#{@vehicle.id}", params: {
        vehicle: {
          plate: "XYZ5690",
          brand: "Toyota",
          model: "Corola",
          year: 2021,
          status: "em_uso",
          fleet_id: fleet.id
        }
      }

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)
      expect(json["brand"]).to eq("Toyota")
      expect(json["plate"]).to eq("XYZ5690")
    end

   it "should deletes the vehicle" do
        vehicle =create(:vehicle)
        delete "/api/v1/vehicles/#{vehicle.id}", headers: auth_headers(@user)

        expect(response).to have_http_status(:no_content)
        expect(Vehicle.exists?(vehicle.id)).to be_falsey
    end
  end
end
