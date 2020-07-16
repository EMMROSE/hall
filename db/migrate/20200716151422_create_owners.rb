class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
