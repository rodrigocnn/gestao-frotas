require 'rails_helper'

RSpec.describe "Fleet Model", type: :model  do
  it "should create a fleet with all  attributes" do
    fleet = create(:fleet)
    expect(fleet).to be_valid
  end

   context "Validations" do
     it "does not allow blank name" do
         fleet = build(:fleet, name: "")
         expect(fleet).to_not be_valid
      end
   end
end
