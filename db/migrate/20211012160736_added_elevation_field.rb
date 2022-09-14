class AddedElevationField < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :elevation, :float
  end
end
