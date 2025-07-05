require 'rails_helper'

RSpec.describe "Trips API", type: :request do
  describe "Trips Module" do
    before do
      @user = create(:user)
      @trip = create(:trip)
    end

    it "returns a list of trips correctly" do
      get "/api/v1/trips", headers: auth_headers(@user)

      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json).to be_an(Array)
      expect(json.size).to eq(1)
    end
  end
end
