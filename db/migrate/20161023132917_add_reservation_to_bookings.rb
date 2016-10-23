class AddReservationToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :reservation, :datetime
  end
end
