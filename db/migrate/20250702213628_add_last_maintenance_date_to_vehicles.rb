class AddLastMaintenanceDateToVehicles < ActiveRecord::Migration[7.2]
  def change
    add_column :vehicles, :last_maintenance_date, :date
  end
end
