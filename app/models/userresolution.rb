class UserResolution < ActiveRecord::Base
  belongs_to :user
  belongs_to :resolution
end
