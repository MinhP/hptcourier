module OrdersHelper
  def get_order_total(order_id)
    items = Orderitem.where(order_id: order_id)
    total = 0
    items.each do |item|
      total = total + (Item.find(item.item_id).price * item.quantity)
    end
    total
  end

  def get_item_name(id)
    Item.find(id).name
  end

  def get_item_description(id)
    Item.find(id).description
  end

  def get_item_price(id)
    Item.find(id).price
  end

  def toggle_purchase_button(orderitem)
    if orderitem.ispurchased?
      link_to(
        content_tag(:span, nil, :class => "glyphicon glyphicon-ok"),
        orderitem_path(orderitem.id, :toggle => "false"),
        :method => :put,
        :remote => true,
        :class => "purchase purchase-true btn btn-sm btn-primary",
        :id => orderitem.id
      )
    else
      link_to(
        content_tag(:span, nil, :class => "glyphicon glyphicon-plus"),
        orderitem_path(orderitem.id, :toggle => "true"),
        :method => :put,
        :remote => true,
        :class => "purchase purchase-false btn btn-sm btn-danger",
        :id => orderitem.id
      )
    end
  end
end
