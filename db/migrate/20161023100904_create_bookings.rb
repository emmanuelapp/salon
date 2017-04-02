class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string   :first_name,      default: '', null: false
      t.string   :last_name,       default: '', null: false
      t.string   :phone,           default: '', null: false
      t.text     :additional_info, default: '', null: false

      t.boolean  :confirmed, default: false
      t.datetime :reserved_at, null: false

      t.timestamps
    end
  end
end
