require 'rails_helper'

RSpec.describe "Trips", type: :model  do
it "cria trip com veículo disponível usando build + save" do
  vehicle = create(:vehicle, status: :disponivel)
  driver = create(:driver)

  trip = build(:trip, vehicle: vehicle, driver: driver)

  expect(trip).to be_valid
end






  it "should set status em_uso after create" do
    vehicle = create(:vehicle, status: :disponivel)
    driver = create(:driver)

    trip = build(:trip, vehicle: vehicle, driver: driver)

    expect(trip).to be_valid
    trip.save!

    vehicle.reload
    expect(vehicle.status).to eq("em_uso")
  end

   context "Validations" do
    it "does not allow blank start_date" do
         trip = build(:trip, start_date: nil)
         expect(trip).to_not be_valid
      end
    end
end
