class UpdateEventerStatus < ActiveRecord::Migration
  def self.up
    change_table :eventers do |t|
      t.change :event_status, :integer
    end
  end
  def self.down
    change_table :eventers do |t|
      t.change :event_status, :string
    end
  end
end
