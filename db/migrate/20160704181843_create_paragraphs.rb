class CreateParagraphs < ActiveRecord::Migration[5.0]
  def change
    create_table :paragraphs do |t|
      t.string :title, default: '', null: false
      t.text   :body,  default: '', null: false
      t.timestamps
    end
  end
end
