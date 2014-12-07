class Order < ActiveRecord::Base
  has_many :orderitem
end
