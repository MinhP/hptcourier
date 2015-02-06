class Item < ActiveRecord::Base
  belongs_to :event
  has_many :orderitems
  validates :name, :presence => true
  validates :price, :presence => true
end
