class CreateParagraphsAgain < ActiveRecord::Migration[5.0]
  def change
    drop_table :paragraphs

    create_table :paragraphs do |t|
      t.text :body
      t.string :title
      t.timestamps
    end
  end
end
