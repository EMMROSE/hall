class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :state
      t.string :name
      t.string :address
      t.string :zipcode
      t.string :city
      t.references :owner, null: false, foreign_key: true
      t.references :shop_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
