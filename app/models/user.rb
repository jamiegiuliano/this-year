class User < ActiveRecord::Base
  has_secure_password
  validates :username, :presence => true, :uniqueness => true, length: { minimum: 4 }
  validates :email, :presence => true, :uniqueness => true, format: /@/
  validates :password, length: { minimum: 6 }

  has_many :events
  has_many :resolutions
end
