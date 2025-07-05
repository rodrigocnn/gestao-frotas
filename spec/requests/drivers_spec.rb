require 'rails_helper'
RSpec.describe "Drivers API", type: :request do
  describe "Drivers Module" do
      before do
          @driver = create(:driver)
      end

       it "returns a list of drivers correctly" do
         get "/api/v1/drivers"

         json = JSON.parse(response.body)

         expect(response).to have_http_status(:ok)
         expect(json).to be_an(Array)
         expect(json.size).to eq(1)
       end

       it "should create a new driver correctly" do
         post "/api/v1/drivers", params: {
              driver: {
              name: "Marcelo Moreno",
              cpf: "090.876.765-72",
              cnh: "38382016441",
              phone: "+642165027443"

            }
         }

          json = JSON.parse(response.body)
          expect(json["name"]).to eq("Marcelo Moreno")
       end

       it "should update a driver correctly" do
          driver  = @driver

          put "/api/v1/drivers/#{driver.id}", params: {
              driver: {
              name: "Lucca Fernandes",
              cpf: driver.cpf,
              cnh: driver.cnh,
              phone: driver.phone

            }
         }

          json = JSON.parse(response.body)
          expect(json["name"]).to eq("Lucca Fernandes")
       end

      it "deletes the driver" do
        driver = create(:driver)
        delete "/api/v1/drivers/#{driver.id}"

        expect(response).to have_http_status(:no_content)
        expect(Driver.exists?(driver.id)).to be_falsey
      end
  end
end
