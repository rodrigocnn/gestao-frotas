class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :vehicle

  enum :status, { planejada: 1, em_andamento: 2, finalizada: 3 }

  before_validation :ensure_vehicle_is_available

  after_create :set_vehicle_status_em_uso
  after_update :set_vehicle_status_disponivel_if_finalized

  validates :start_date, :end_date, :origin, :destination, :status, presence: true

  scope :filter_by_status, ->(status_value) { where(status: status_value) }

  private

  def ensure_vehicle_is_available
    return unless vehicle.present?

    unless vehicle.disponivel?
      errors.add(:vehicle, "não está disponível para essa viagem")
    end
  end

  def set_vehicle_status_em_uso
    vehicle.update_column(:status, :em_uso)
  end

  def set_vehicle_status_disponivel_if_finalized
    if saved_change_to_status? && finalizada?
      vehicle.update_column(:status, :disponivel)
    end
  end
end
