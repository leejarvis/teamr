class User < ActiveRecord::Base
  attr_accessible :name
  has_many :teams
  has_many :projects, through: :teams
  has_and_belongs_to_many :assigned_contacts, class_name: 'Contact'
end
