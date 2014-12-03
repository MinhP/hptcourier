class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.string :name
      t.string :description
      t.decimal :price
      t.integer :event_id
      t.string :imageurl
    end
  end
end
