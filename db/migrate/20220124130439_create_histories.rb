class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|

      t.belongs_to :articles
      t.belongs_to :users
      t.datetime :action_date
      t.timestamps
    end
  end
end
