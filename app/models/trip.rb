class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :vehicle
end
