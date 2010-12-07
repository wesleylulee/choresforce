class AddActiveFlagToListing < ActiveRecord::Migration
  def self.up
    add_column :listings, :active, :boolean, :default => true
  end

  def self.down
    remove_column :listings, :active
  end
end
