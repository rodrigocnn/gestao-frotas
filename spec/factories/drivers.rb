FactoryBot.define do
  factory :driver do
    name { Faker::Name.name }
    cpf { "#{Faker::Number.number(digits: 3)}.#{Faker::Number.number(digits: 3)}.#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 2)}" }
    cnh { Faker::Number.number(digits: 11).to_s }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
  end
end
