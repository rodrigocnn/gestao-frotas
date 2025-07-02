class VehicleSerializer < ActiveModel::Serializer
   attributes :id, :brand, :model, :plate, :year, :status
end
