class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :offers
  CATEGORIES = ['Baby-Sitting', 'Gardening', 'Carpentary', 'Miscellaneous', 'Other']
end
