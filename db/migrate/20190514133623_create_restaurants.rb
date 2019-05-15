class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :image_url, null: false
      t.string :categories, null: false, array: true
      t.float :rating, null: false
      t.string :address1, null: false
      t.string :city, null: false
      t.string :zip_code, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.string :display_phone, null: false
      t.float :distance, null: false
      t.string :price, null: false
      t.integer :review_count, null: false

      t.timestamps
    end
  end
end
