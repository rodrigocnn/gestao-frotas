FactoryBot.define do
  factory :trip do
    start_date { Faker::Date.backward(days: 10) }
    end_date { start_date + rand(1..5).days }
    origin { Faker::Address.city }
    destination { Faker::Address.city }
    status { Trip.statuses.keys.sample }  # Considerando enum com nomes como string
    driver_id { Driver.pluck(:id).sample || create(:driver).id }
    vehicle_id { Vehicle.pluck(:id).sample || create(:vehicle).id }
  end
end
