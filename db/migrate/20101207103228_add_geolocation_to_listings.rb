class AddGeolocationToListings < ActiveRecord::Migration
  def self.up
	remove_column :listings, :zipcode
	add_column :listings, :address, :string
	add_column :listings, :lat, :decimal
	add_column :listings, :lng, :decimal
  end

  def self.down
	add_column :listings, :zipcode, :integer
	remove_column :listings, :address
	remove_column :listings, :lat
	remove_column :listings, :lng
  end
end
