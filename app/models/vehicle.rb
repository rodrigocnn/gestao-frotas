class Vehicle < ApplicationRecord
  belongs_to :fleet
  has_many :trips

  enum status: { disponivel: 1, em_uso: 2, manutencao: 3 }

  validates :plate, :brand, :model, :year, :status, :fleet, presence: true

  scope :filter_by_status, ->(status_value) { where(status: status_value) }
  scope :filter_by_brand, ->(brand) { where(brand: brand) }

  def self.filtered_vehicles(status: nil, brand: nil, year: nil)
    vehicles = all
    vehicles = vehicles.filter_by_status(status) if status.present?
    vehicles = vehicles.filter_by_brand(brand) if brand.present?
    vehicles = vehicles.order(year: :asc) if year.present?
    vehicles
  end
end
