class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :day
      t.datetime :duration
      t.integer :total_price
      t.boolean :confirmed, default: false
      t.boolean :completed, default: false
      t.references :user, null: false, foreign_key: true
      t.references :photographer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
