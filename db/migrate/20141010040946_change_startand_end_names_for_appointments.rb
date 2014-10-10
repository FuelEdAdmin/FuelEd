class ChangeStartandEndNamesForAppointments < ActiveRecord::Migration
  def change
    change_table :appointments do |t|
      t.rename :start, :start_time
      t.rename :end, :end_time
  end
  end
end
