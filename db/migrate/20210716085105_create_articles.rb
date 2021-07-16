class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.datetime :birthdate
      t.datetime :deathdate
      t.string :job

      t.timestamps
    end
  end
end
