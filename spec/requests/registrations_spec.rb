require 'rails_helper'
RSpec.describe "Users Registration", type: :request do
  describe "Registrations Create" do
       it "should create a new user correctly" do
          post "/api/v1/users", params: {
              user: {
              email: "arias@globo.com",
              password: "123456",
              password_confirmation: "123456"
            }
         }

         json = JSON.parse(response.body)
         email =  json["user"]["email"]
         expect(response).to have_http_status(:ok)
         expect(email).to eq("arias@globo.com")
       end
  end
end
