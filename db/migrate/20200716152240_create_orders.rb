class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.string :email
      t.string :fullname
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :checkout_session_id
      t.monetize :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
