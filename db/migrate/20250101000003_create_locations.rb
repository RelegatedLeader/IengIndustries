class CreateLocations < ActiveRecord::Migration[8.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.string :address
      t.integer :location_type, default: 0
      t.text :description
      t.string :city
      t.string :country
      t.string :postal_code

      t.timestamps
    end
    
    add_index :locations, :name
    add_index :locations, [:latitude, :longitude]
  end
end
