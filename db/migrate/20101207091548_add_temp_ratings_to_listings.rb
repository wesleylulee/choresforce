class AddTempRatingsToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :worker_rating, :float
    add_column :listings, :employer_rating, :float
  end

  def self.down
    remove_column :listings, :worker_rating
    remove_column :listings, :employer_rating
  end
end
