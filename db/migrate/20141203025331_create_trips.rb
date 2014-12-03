class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    t.integer :userid # Person taking trip
    t.string :destination 
    t.datetime :startdate # Start of trip
    t.datetime :enddate # End of trip
    end
  end
end
