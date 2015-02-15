class Event < ActiveRecord::Base
  has_many :items
  has_many :orders
  accepts_nested_attributes_for :items, allow_destroy: true
  validates :currency, length: { is: 3 }, format: { with: /\A[A-Z]{3}\z/}
  
  def cur_prefix
    case self.currency
    when "USD"
      "$"
    when "JPY"
      "¥"
    else
      ""
    end
  end
    
  def cur_precision
    case self.currency
    when "JPY"
      0
    else
      2
    end
  end
    
end
