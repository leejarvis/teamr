# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
project = Project.create(name: 'Project 1')

[{name: 'Lee'}, {name: 'John'}].each do |values|
  user = User.new(values)
  user.projects << project
  user.save
end

10.times { |i| Contact.create!(name: "Contact #{i}") }

Contact.all.each do |c|
  c.auto_assign_team_member(project)
end

Contact.all.each do |c|
  puts "#{c.name} was assigned #{c.assigned_users.map(&:name).join(', ')}"
end
