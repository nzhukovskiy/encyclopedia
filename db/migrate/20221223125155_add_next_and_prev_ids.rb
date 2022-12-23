class AddNextAndPrevIds < ActiveRecord::Migration[6.1]
  def change
    change_table :histories do |t|
      t.references :previous_archived, foreign_key: { to_table: 'archived_articles' }
      t.references :next_archived, foreign_key: { to_table: 'archived_articles' }
    end
  end
end
