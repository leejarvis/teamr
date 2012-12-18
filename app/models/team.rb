class Team < ActiveRecord::Base
  attr_accessible :last_assigned_user_at
  belongs_to :project
  belongs_to :user
end
