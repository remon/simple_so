class CreateTravelings < ActiveRecord::Migration
  def change
    create_table :travelings do |t|
      t.integer :country_id
      t.integer :user_id
      t.date :visited_at
      t.boolean :visited

      t.timestamps
    end
  end
end
