class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :date_added
      t.float :price
      t.text :description
      t.string :product_id
      t.string :image_url

      t.timestamps
    end
  end
end
