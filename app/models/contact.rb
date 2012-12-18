class Contact < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :assigned_users, class_name: 'User'

  def auto_assign_team_member(project)
    team = project.teams(true).order('last_assigned_contact_at ASC').first
    if team && (user = team.user)
      self.assigned_users << user
      team.send(:write_attribute, :last_assigned_contact_at, Time.current)
      team.save
    end
  end
end
