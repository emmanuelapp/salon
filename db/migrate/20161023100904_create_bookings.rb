class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.boolean :approved
      t.text :additional_info

      t.timestamps
    end
  end
end
