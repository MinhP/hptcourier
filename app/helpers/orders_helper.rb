module OrdersHelper
  def order_total(order_id)
    items = Orderitem.where(order_id: order_id)
    total = 0
    items.each do |item|
      total = total + (Item.find(item.item_id).price * item.quantity)
    end
    total
  end

  def show_item_name(id)
    Item.find(id).name
  end

  def show_item_description(id)
    Item.find(id).description
  end

  def show_item_price(id)
    Item.find(id).price
  end
end
