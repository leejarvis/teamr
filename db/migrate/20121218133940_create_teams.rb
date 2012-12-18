class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :user_id
      t.integer :project_id
      t.datetime :last_assigned_contact_at

      t.timestamps
    end

    create_table :contacts_users, id: false do |t|
      t.integer :user_id
      t.integer :contact_id
    end
  end
end
