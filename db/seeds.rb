require "factory_bot_rails"
require "faker"

FactoryBot.definition_file_paths = [ File.expand_path("spec/factories", __dir__) ]
FactoryBot.find_definitions

include FactoryBot::Syntax::Methods


puts "Criando Frotas"

5.times do
  create(:fleet)
end

puts "Criando Veículos"
10.times { create(:vehicle) }

puts "Criando Motoristas"
5.times { create(:driver) }

puts "Criando Viagens"
3.times { create(:trip) }

puts "Fim"
