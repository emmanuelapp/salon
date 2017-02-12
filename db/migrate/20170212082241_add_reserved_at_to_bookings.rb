class AddReservedAtToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :reserved_at, :datetime
  end
end
