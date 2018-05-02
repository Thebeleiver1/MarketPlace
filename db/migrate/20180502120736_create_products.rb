class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :condition
      t.string :location
      t.string :image
      t.string :category
      t.integer :sellerId

      t.timestamps
    end
  end
end
