require 'rails_helper'

RSpec.describe Trip, type: :model do
  let(:vehicle) { create(:vehicle, status: :disponivel) }
  let(:driver) { create(:driver) }

  describe "Criação de viagem" do
    it "cria trip com veículo disponível" do
      trip = create(:trip, vehicle: vehicle, driver: driver)
      expect(trip).to be_valid
    end

    it "define status do veículo como em_uso após criar trip" do
      create(:trip, vehicle: vehicle, driver: driver)
      expect(vehicle.status).to eq("em_uso")
    end
  end

  describe "Finalização de viagem" do
    it "atualiza status do veículo para disponivel se trip for finalizada" do
      trip = create(:trip, vehicle: vehicle, driver: driver)
      trip.update!(status: :finalizada)
      expect(vehicle.reload.status).to eq("disponivel")
    end
  end

  describe "Validações" do
    it "não permite start_date em branco" do
      trip = build(:trip, start_date: nil)
      expect(trip).to_not be_valid
      expect(trip.errors[:start_date]).to include("can't be blank")
    end
  end
end
