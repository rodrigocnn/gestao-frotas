class MaintenanceNotifierJob
  include Sidekiq::Job

  def perform(*args)
    threshold_date = Date.today - 11.months

    Vehicle.where("last_maintenance_date <= ?", threshold_date).find_each do |vehicle|
      puts "🚗 Manutenção próxima para o veículo #{vehicle.plate} (última em #{vehicle.last_maintenance_date})"
    end
  end
end
