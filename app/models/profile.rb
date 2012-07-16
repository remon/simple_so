class Profile < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "100x100>", :thumb => "25x25>"}
  belongs_to :user
  def prowned_by?(owner)
    return false unless owner.is_a? User
    user == owner 
  end
end
