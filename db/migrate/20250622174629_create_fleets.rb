class CreateFleets < ActiveRecord::Migration[7.2]
  def change
    create_table :fleets do |t|
      t.string :name
      t.string :responsible

      t.timestamps
    end
  end
end
