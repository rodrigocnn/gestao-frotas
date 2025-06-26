FactoryBot.define do
  factory :vehicle do
    plate { "#{Faker::Alphanumeric.alpha(number: 3).upcase}#{Faker::Number.number(digits: 4)}" }
    brand { Faker::Vehicle.manufacture }
    model { Faker::Vehicle.model }
    year { rand(2010..2023) }
    status { Vehicle.statuses.keys.sample } # exemplo: "disponivel", "em_uso", "manutencao"
    fleet_id { Fleet.pluck(:id).sample || create(:fleet).id } # pega um fleet_id existente ou cria um novo
  end
end
