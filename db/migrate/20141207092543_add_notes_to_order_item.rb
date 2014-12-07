class AddNotesToOrderItem < ActiveRecord::Migration
  def change
    add_column :orderitems, :notes, :string
  end
end
