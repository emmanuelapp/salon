class AddDefaultValuesForParagraphsColumns < ActiveRecord::Migration[5.0]
  def change
    change_column_default :paragraphs, :body, ''
    change_column_default :paragraphs, :title, ''
  end
end
