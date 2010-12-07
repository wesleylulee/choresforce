class Message < ActiveRecord::Base
  belongs_to :listing
  belongs_to :sender, :class_name=>'User', :foreign_key=>'from'
  belongs_to :recipient, :class_name=>'User', :foreign_key=>'to'
end
