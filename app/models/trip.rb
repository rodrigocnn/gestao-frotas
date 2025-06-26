class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :vehicle

  enum status: { planejada: 1, em_andamento: 2, finalizada: 3 }
  validates :start_date, :end_date, :origin, :destination, :status, presence: true

  scope :filter_by_status, ->(status_value) { where(status: status_value) }
end
