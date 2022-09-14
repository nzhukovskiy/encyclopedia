class ChangeIdsNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :histories, :users_id, :user_id
    rename_column :histories, :articles_id, :article_id
  end
end
