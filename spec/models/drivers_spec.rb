require 'rails_helper'

RSpec.describe "Driver Model", type: :model  do
  it "should create a fleet with all  attributes" do
    fleet = create(:fleet)
    expect(fleet).to be_valid
  end

    context "Validations" do
      it "does not allow blank name" do
        driver = build(:driver, name: "")
        expect(driver).to_not be_valid
      end

      it "does not allow blank cpf" do
        driver = build(:driver, cpf: "")
        expect(driver).to_not be_valid
      end

      it "does not allow blank cnh" do
        driver = build(:driver, cnh: "")
        expect(driver).to_not be_valid
      end

      it "does not allow blank phone" do
        driver = build(:driver, phone: "")
        expect(driver).to_not be_valid
      end
    end
end
