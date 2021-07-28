class AddedPlaceForArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :birth_country, :string
    add_column :articles, :birth_place, :string
    add_column :articles, :death_country, :string
    add_column :articles, :death_place, :string
  end
end
