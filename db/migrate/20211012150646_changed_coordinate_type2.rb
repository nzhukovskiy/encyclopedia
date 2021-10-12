class ChangedCoordinateType2 < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :coordinates, :text, default: ''
  end
end
