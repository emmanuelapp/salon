class RemoveReservationFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :reservation
  end
end
