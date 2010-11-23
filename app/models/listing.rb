class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :offers
  CATEGORIES = ['Baby-Sitting', 'Gardening', 'Carpentary', 'Miscellaneous', 'Other']
  validates_presence_of		:title
  validates_presence_of		:category
  validates_presence_of		:approx_payment
end
