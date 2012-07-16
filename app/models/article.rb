class Article < ActiveRecord::Base
 default_scope order("created_at DESC")
  validates :body,:presence=>true
  belongs_to :user
  has_many :comments,:dependent=>:destroy
  #accepts_nested_attributes_for :blockinglist
  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner 
  end
end
