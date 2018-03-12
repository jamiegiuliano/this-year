class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email, :password

  has_many :resolutions
  has_many :events
end
