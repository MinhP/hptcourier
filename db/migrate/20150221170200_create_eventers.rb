class CreateEventers < ActiveRecord::Migration
  def change
    create_table :eventers do |t|
    t.integer :event_id  # Event being attended
    t.integer :user_id # Person taking trip
    t.string  :event_status #event status
    end
  end
end