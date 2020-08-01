class ChangeColumnOnPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :type, :string
    add_column :plants, :species, :string
  end
end
