class ChangedHistoryTypeName < ActiveRecord::Migration[6.1]
  def change
    rename_column :histories, :type, :action_type
  end
end
