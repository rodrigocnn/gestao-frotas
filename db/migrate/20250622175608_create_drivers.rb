class CreateDrivers < ActiveRecord::Migration[7.2]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :cpf
      t.string :cnh
      t.string :phone

      t.timestamps
    end
  end
end
