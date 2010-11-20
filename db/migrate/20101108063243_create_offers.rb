class CreateOffers < ActiveRecord::Migration
  def self.up
    create_table :offers do |t|
      t.integer :user_id
      t.integer :listing_id
      t.decimal :amount
      t.decimal :distance

      t.timestamps
    end
  end

  def self.down
    drop_table :offers
  end
end
