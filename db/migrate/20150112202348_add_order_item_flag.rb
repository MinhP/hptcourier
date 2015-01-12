class AddOrderItemFlag < ActiveRecord::Migration
  def change
    add_column :orderitems, :ispurchased, :boolean, null: false, default: false
  end
end
