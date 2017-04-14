class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.text    :description, default: '',  null: false
      t.string  :name,        default: '',  null: false
      t.decimal :price,       default: 0.0, null: false
      t.integer :member_id

      t.timestamps
    end
  end
end
