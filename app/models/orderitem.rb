class Orderitem < ActiveRecord::Base
  default_scope { order('id ASC') }
  belongs_to :order
  belongs_to :item
end
