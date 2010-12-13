class AddFlagsForNotifications < ActiveRecord::Migration
  def self.up
	add_column :messages, :unread, :boolean, :default => true
	add_column :listings, :newOffer, :boolean, :default => false
	add_column :offers, :listingChanged, :boolean, :default => false
  end

  def self.down
	remove_column :messages, :unread, :boolean
	remove_column :listings, :newOffer, :boolean
	remove_column :offers, :listingChanged, :boolean
  end
end
