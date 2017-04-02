class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :first_name,   default: '', null: false
      t.string :last_name,    default: '', null: false
      t.string :profession,   default: '', null: false
      t.string :phone_number, default: '', null: false
      t.text   :description,  default: '', null: false

      t.timestamps
    end
  end
end
