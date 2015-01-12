class Order < ActiveRecord::Base
  default_scope { order('id DESC') }
  has_many :orderitems
  belongs_to :event
  belongs_to :user
end
