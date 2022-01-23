class AddedCoordinatesForPlaces < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :coordinates, :float, array: true, default: []
  end
end
