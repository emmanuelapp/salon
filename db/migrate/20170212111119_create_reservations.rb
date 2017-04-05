class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :booking_id
      t.integer :offer_id

      t.timestamps
    end
  end
end
