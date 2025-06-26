FactoryBot.define do
  factory :fleet do
    name { Faker::Company.industry }
    responsible { Faker::Name.name }
  end
end
