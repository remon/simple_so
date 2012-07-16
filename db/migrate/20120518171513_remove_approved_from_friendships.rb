class RemoveApprovedFromFriendships < ActiveRecord::Migration
  def self.up
    remove_column :friendships, :approved
  end

  
end
