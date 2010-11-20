class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validates_presence_of		:amount
  validates_numericality_of	:amount
end
