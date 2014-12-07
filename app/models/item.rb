class Item < ActiveRecord::Base
  belongs_to :event
  validates :name, :presence => true
  validates :price, :presence => true
end
