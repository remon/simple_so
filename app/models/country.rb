class Country < ActiveRecord::Base
  has_many :statuses,:dependent=>:destroy
   has_many :travelings 
  has_many :users,:through=>:travelings
  has_attached_file :photo, :styles => { :medium => "100x100>", :thumb => "25x25>"}
end
