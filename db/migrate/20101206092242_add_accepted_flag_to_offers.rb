class AddAcceptedFlagToOffers < ActiveRecord::Migration
  def self.up
    add_column :offers, :accepted, :boolean, :default => false
  end

  def self.down
    remove_column :offers, :accepted
  end
end
