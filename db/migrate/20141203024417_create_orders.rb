class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :userid # Person who owns order
      t.integer :eventid # Event that the order belongs to
      t.integer :buyerid # Person who is buying the items
      t.integer :holderid # Person who is holding the items
      t.integer :courierid # Person who is transporting the items
    end
  end
end
