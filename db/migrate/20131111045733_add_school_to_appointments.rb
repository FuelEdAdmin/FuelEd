class AddSchoolToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :school, :string
  end
end
