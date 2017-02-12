class AddReservedAtToBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :reserved_at
    add_column :bookings, :reserved_at, :datetime
  end
end
