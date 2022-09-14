class AddedColumnsData < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :columns_data, :text, default: '[]'
  end
end
