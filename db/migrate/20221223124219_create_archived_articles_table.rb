class CreateArchivedArticlesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :archived_articles do |t|
      t.string "title"
      t.text "body"
      t.datetime "birthdate"
      t.datetime "deathdate"
      t.string "job"
      t.string "birth_country"
      t.string "birth_place"
      t.string "death_country"
      t.string "death_place"
      t.text "resources", default: "[]"
      t.text "duties", default: "[]"
      t.text "columns_data", default: "[]"
      t.text "coordinates", default: ""
      t.float "elevation"
      t.timestamps
    end
  end
end
