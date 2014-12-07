class Event < ActiveRecord::Base
  has_many :items
  has_many :orders
  accepts_nested_attributes_for :items, allow_destroy: true
end
