class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :user_id
      t.string :title
      t.string :category
      t.integer :zipcode
      t.text :description
      t.decimal :approx_payment

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
