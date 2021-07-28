class AddedJsonArrayToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :resources, :text, default: '[]'

  end
end
