class Vehicle < ApplicationRecord
  belongs_to :fleet
  has_many :trips

  enum status: { disponivel: 1, em_uso: 2, manutencao: 3 }
  validates :plate, :brand, :model, :year, :status, :fleet, presence: true
  scope :filter_by_status, ->(status_value) { where(status: status_value) }
end
