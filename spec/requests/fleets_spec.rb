require 'rails_helper'

RSpec.describe "Fleets API", type: :request do
  describe "Fleets Module" do
    before do
       @user = create(:user)
       @fleet = create(:fleet)
    end

    it "returns a list of fleets correctly" do
      get "/api/v1/fleets", headers: auth_headers(@user)

      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json).to be_an(Array)
      expect(json.size).to eq(1)
    end

    it "should create a new fleet correctly" do
      post "/api/v1/fleets",
        params: {
          fleet: {
            name: "Manutenção",
            responsible: "Marcelo Moreno"
          }
        }.to_json,
        headers: auth_headers(@user).merge({ "Content-Type" => "application/json" })

      json = JSON.parse(response.body)

      expect(response).to have_http_status(:created)
      expect(json["name"]).to eq("Manutenção")
    end


    it "should update a new fleet correctly" do
      fleet  = @fleet

      put "/api/v1/fleets/#{fleet.id}",
        params: {
          fleet: {
            name: "Manutenção",
            responsible: fleet.responsible
          }
        }.to_json,
        headers: auth_headers(@user).merge({ "Content-Type" => "application/json" })

      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json["name"]).to eq("Manutenção")
    end

     it "deletes the fleet" do
        fleet = create(:fleet)

        delete "/api/v1/fleets/#{fleet.id}", headers: auth_headers(@user)

        expect(response).to have_http_status(:no_content)
        expect(Fleet.exists?(fleet.id)).to be_falsey
      end
  end
end
