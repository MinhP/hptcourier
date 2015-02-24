class UpdateEventerStatus < ActiveRecord::Migration
  def self.up
    change_table :eventers do |t|
      t.change :event_status, 'integer USING CAST(event_status AS integer)'
    end
  end
  def self.down
    change_table :eventers do |t|
      t.change :event_status, :string
    end
  end
end
