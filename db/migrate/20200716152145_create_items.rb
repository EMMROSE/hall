class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.integer :stock
      t.monetize :price
      t.timestamps
    end
  end
end
