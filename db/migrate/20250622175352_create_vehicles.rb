class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.string :brand
      t.string :model
      t.integer :year
      t.integer :status
      t.references :fleet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
