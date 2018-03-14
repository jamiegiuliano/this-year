class User < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods

  has_secure_password
  validates :username, :presence => true, :uniqueness => { case_sensitive: false }
  validates :email, :presence => true, :uniqueness => true, format: /@/
  validates_presence_of :password

  has_many :events
  has_many :resolutions, through: :user_resolutions
end
