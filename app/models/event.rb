class Event < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods

  validates_presence_of :name, :date

  belongs_to :user
end
