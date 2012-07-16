class DropTableTravelings < ActiveRecord::Migration
  def self.up
    drop_table :travelings
  end

end
