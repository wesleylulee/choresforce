class AddGeolocationToUsers < ActiveRecord::Migration
  def self.up
	remove_column :users, :zipcode
	add_column :users, :address, :string
	add_column :users, :lat, :decimal
	add_column :users, :lng, :decimal
  end

  def self.down
	add_column :users, :zipcode, :integer
	remove_column :users, :address
	remove_column :users, :lat
	remove_column :users, :lng
  end
end
