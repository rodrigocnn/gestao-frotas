require 'rails_helper'

RSpec.describe "Trips API", type: :request do
  describe "Trips Module" do
    before do
      @user = create(:user)
      @trip = create(:trip)
      @vehicle = create(:vehicle)
      @driver = create(:driver)
    end

    it "returns a list of trips correctly" do
      get "/api/v1/trips", headers: auth_headers(@user)

      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json).to be_an(Array)
      expect(json.size).to eq(1)
    end

    it "should create a new trip correctly" do
         post "/api/v1/trips", params: {
              trip: {
              start_date: "2025-06-23",
              end_date: "2025-06-26",
              origin: "São Paulo",
              destination: "Rio de Janeiro",
              status: "planejada",
              driver_id:  @driver.id,
              vehicle_id: @vehicle.id

            }
          }.to_json,
        headers: auth_headers(@user).merge({ "Content-Type" => "application/json" })

          json = JSON.parse(response.body)

          expect(json["origin"]).to eq("São Paulo")
          expect(json["destination"]).to eq("Rio de Janeiro")
    end

    it "should update a new trip correctly" do
      trip  = @trip

      put "/api/v1/trips/#{trip .id}",
        params: {
           trip: {
              start_date: "2025-06-23",
              end_date: "2025-06-26",
              origin: "Bahia",
              destination: "Rio de Janeiro",
              status: "planejada",
              driver_id:  @driver.id,
              vehicle_id: @vehicle.id

            }
        }.to_json,
        headers: auth_headers(@user).merge({ "Content-Type" => "application/json" })

      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json["origin"]).to eq("Bahia")
    end

    it "deletes the trip" do
        trip = create(:trip)

        delete "/api/v1/trips/#{trip.id}", headers: auth_headers(@user)

        expect(response).to have_http_status(:no_content)
        expect(Trip.exists?(trip.id)).to be_falsey
    end
  end
end
