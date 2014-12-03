class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|

      t.integer :order_id # Order associated with
      t.integer :item_id # Item ordered
      t.integer :quantity # Quantity
    end
  end
end
