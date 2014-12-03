class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|

      t.integer :orderid # Order associated with
      t.integer :itemid # Item ordered
      t.integer :quantity # Quantity
    end
  end
end
