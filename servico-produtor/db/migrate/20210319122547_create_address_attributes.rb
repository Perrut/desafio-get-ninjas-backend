class CreateAddressAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :address_attributes do |t|
      t.string :city
      t.string :neighborhood
      t.string :street
      t.string :uf
      t.string :zip_code
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
