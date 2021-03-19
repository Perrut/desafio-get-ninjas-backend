class AddLatAndLngToAddressAttributes < ActiveRecord::Migration[6.1]
  def change
    add_column :address_attributes, :lat, :string
    add_column :address_attributes, :lng, :string
  end
end
