class AddApprove < ActiveRecord::Migration
  def change
    add_column :users, :is_approved, :boolean, :default => false, :null => false
  end
end
