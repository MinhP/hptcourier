class UpdateEventerStatus < ActiveRecord::Migration
  def self.up
    change_table :eventers do |t|
      t.change :event_status, 'integer USING CAST(column_name AS integer)'
    end
  end
  def self.down
    change_table :eventers do |t|
      t.change :event_status, :string
    end
  end
end
