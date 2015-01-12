class RemoveOrderColumns < ActiveRecord::Migration
  def change
    remove_column :orders, :buyer_id
    remove_column :orders, :holder_id
  end
end
