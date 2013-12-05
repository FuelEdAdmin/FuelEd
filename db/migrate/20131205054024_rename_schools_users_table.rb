class RenameSchoolsUsersTable < ActiveRecord::Migration
  def self.up
    create_table :schools_users, :id => false do |t|
            t.references :user
        t.references :school
    end
    add_index :schools_users, [:user_id, :school_id]
    add_index :schools_users, :user_id
    drop_table :users_schools
  end

  def self.down
    drop_table :schools_users
  end
end