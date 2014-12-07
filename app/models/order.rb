class Order < ActiveRecord::Base
  has_many :orderitems
  belongs_to :event
  belongs_to :user
end
