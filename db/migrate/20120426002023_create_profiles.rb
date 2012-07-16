class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :looking_for
      t.date :birthday
      t.string :email
      t.text :about

      t.timestamps
    end
  end
end
