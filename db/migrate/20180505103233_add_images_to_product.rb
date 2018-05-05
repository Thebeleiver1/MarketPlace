class AddImagesToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :images, :string, array: true, default: []
  end
end
