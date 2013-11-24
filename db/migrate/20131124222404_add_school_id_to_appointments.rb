class AddSchoolIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :school_id, :integer
  end
end
