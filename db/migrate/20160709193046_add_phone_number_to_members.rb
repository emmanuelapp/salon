class AddPhoneNumberToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :phone_number, :string
  end
end
