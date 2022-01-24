class AddedHistoryType < ActiveRecord::Migration[6.1]
  def change
    add_column :histories, :type, :int
  end
end
