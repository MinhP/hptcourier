class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id # Person who owns order
      t.integer :event_id # Event that the order belongs to
      t.integer :buyer_id # Person who is buying the items
      t.integer :holder_id # Person who is holding the items
      t.integer :courier_id # Person who is transporting the items
    end
  end
end
