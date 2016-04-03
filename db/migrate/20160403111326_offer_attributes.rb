class OfferAttributes < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :description, :string
    add_column :offers, :name, :string
  end
end
