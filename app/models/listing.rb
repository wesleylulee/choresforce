include GeoKit::Mappable

class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :offers
  #acts_as_mappable :default_formula => :flat
  CATEGORIES = ['Housekeeping', 'Baby-Sitting', 'Gardening', 'Carpentary', 'Miscellaneous', 'Other']
  validates_presence_of		:address
  validates_presence_of		:category
  validates_presence_of		:approx_payment
  validates_presence_of		:lat, :message => "Your address seems to be invalid"
  validates_presence_of		:lng, :message => "Example Format: 1 Infinite Loop Cupertino, CA 95015"

  acts_as_indexed :fields => [ :address, :category, :description, :approx_payment ]
 
 
end
