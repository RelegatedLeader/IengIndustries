class CreateRoutes < ActiveRecord::Migration[8.1]
  def change
    create_table :routes do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.string :name
      t.references :start_location, foreign_key: { to_table: :locations }
      t.references :end_location, foreign_key: { to_table: :locations }
      t.decimal :distance_km, precision: 10, scale: 2
      t.integer :estimated_duration_minutes
      t.integer :status, default: 0
      t.text :description
      t.integer :stops_count, default: 0

      t.timestamps
    end
    
    add_index :routes, :name
  end
end
