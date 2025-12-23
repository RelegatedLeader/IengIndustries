class CreateVehicles < ActiveRecord::Migration[8.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.integer :vehicle_type, null: false
      t.string :license_plate
      t.integer :capacity
      t.references :driver, foreign_key: { to_table: :users }
      t.integer :status, default: 0
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.integer :energy_type, default: 0
      t.text :description
      t.string :color
      t.integer :year_manufactured
      t.decimal :hourly_rate, precision: 10, scale: 2

      t.timestamps
    end
    
    add_index :vehicles, :license_plate, unique: true
  end
end
