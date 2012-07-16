class AddUserWhoCommentedIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_who_commented_id, :integer

  end
end
