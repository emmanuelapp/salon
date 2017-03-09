class AddDefaultValuesForOffersColumns < ActiveRecord::Migration[5.0]
  def change
    change_column_default :offers, :name, ''
    change_column_default :offers, :description, ''
    change_column_default :offers, :price, 0.0
  end
end
