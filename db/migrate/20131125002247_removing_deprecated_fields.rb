class RemovingDeprecatedFields < ActiveRecord::Migration
  def change
  	remove_column :appointments, :date, :string
  	remove_column :identities, :add_school_to_identities, :string
  	remove_column :identities, :school, :string
  	remove_column :schools, :location, :string
  end
end
