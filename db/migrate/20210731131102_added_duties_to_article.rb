class AddedDutiesToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :duties, :text, default: '[]'
  end
end
