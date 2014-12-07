module ItemsHelper
  def get_item_name(id)
    Item.find(id).name
  end

  def get_item_description(id)
    Item.find(id).description
  end

  def get_item_price(id)
    Item.find(id).price
  end
end
