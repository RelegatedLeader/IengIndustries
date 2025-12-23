class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.references :pickup_location, foreign_key: { to_table: :locations }
      t.references :dropoff_location, foreign_key: { to_table: :locations }
      t.datetime :scheduled_time
      t.datetime :completed_at
      t.integer :status, default: 0
      t.integer :payment_status, default: 0
      t.decimal :estimated_fare, precision: 10, scale: 2
      t.decimal :actual_fare, precision: 10, scale: 2
      t.integer :passenger_count, default: 1
      t.text :special_requests
      t.string :confirmation_code

      t.timestamps
    end
    
    add_index :bookings, :status
    add_index :bookings, :scheduled_time
    add_index :bookings, :confirmation_code, unique: true
  end
end
