class Resolution < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods

  validates_presence_of :name

  has_many :users, through: :user_resolutions
end
