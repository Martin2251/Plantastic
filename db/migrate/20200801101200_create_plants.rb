class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :photo
      t.string :type
      t.string :category
      t.integer :price
      t.string :address
      t.text :description
      t.integer :longitude
      t.integer :latitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
