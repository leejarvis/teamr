class Project < ActiveRecord::Base
  attr_accessible :name
  has_many :teams
  has_many :users, through: :teams
end
