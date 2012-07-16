require 'digest'
class User < ActiveRecord::Base

  has_many :travelings 
  has_many :countries,:through=>:travelings
  has_many :friendships
  has_many :friends,:through=>:friendships
 attr_accessor :password
 has_many :comments

  has_one :profile,:dependent => :destroy
  has_many :articles,:dependent => :nullify
  has_many :replies, :through => :articles, :source => :comments
 validates :email, :uniqueness => true,
:length => { :within => 5..50 },
:format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
validates :password, :confirmation => true,
:length => { :within => 4..20 },
:presence => true,
:if => :password_required?
before_save :encrypt_new_password
def travelingcountries
  self.travelings.where(:visited=>"true")
end
def untravelingcountries
  self.travelings.where(:visited=>"false")
end
def self.authenticate(email, password)
user = find_by_email(email)
return user if user && user.authenticated?(password)
end
def authenticated?(password)
self.hashed_password == encrypt(password)
end
protected
def encrypt_new_password
return if password.blank?
self.hashed_password = encrypt(password)
end
def password_required?
hashed_password.blank? || password.present?
end
def encrypt(string)
Digest::SHA1.hexdigest(string)
end
end
