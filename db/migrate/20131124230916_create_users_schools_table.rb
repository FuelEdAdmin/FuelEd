class CreateUsersSchoolsTable < ActiveRecord::Migration
  def change
    create_table :users_schools, :id => false do |t|
    	t.references :user
      t.references :school
    end
    add_index :users_schools, [:user_id, :school_id]
    add_index :users_schools, :user_id
  end

  def self.down
    drop_table :users_schools
  end
end
