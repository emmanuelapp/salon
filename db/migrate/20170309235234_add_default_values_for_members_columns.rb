class AddDefaultValuesForMembersColumns < ActiveRecord::Migration[5.0]
  def change
    change_column_default :members, :first_name, ''
    change_column_default :members, :last_name, ''
    change_column_default :members, :profession, ''
    change_column_default :members, :description, ''
  end
end
