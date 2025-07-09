FactoryBot.define do
  factory :trip do
    start_date { Faker::Date.backward(days: 10) }
   end_date { (start_date || Date.today) + rand(1..5).days }
    origin { Faker::Address.city }
    destination { Faker::Address.city }
    status { :planejada }    # símbolo, não string
    association :driver
    association :vehicle
  end
end
