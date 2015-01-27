class Isdelivered < ActiveRecord::Migration
  def change
    add_column :orders, :isdelivered, :boolean, null: false, default: false
  end
end
