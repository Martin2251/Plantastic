class ChangeColumnsOnPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :longitude, :integer
    add_column :plants, :longitude, :float
    remove_column :plants, :latitude, :integer
    add_column :plants, :latitude, :float
  end
end
