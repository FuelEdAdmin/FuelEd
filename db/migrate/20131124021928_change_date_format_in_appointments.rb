class ChangeDateFormatInAppointments < ActiveRecord::Migration
  def self.up
   change_column :appointments, :start, :datetime
   change_column :appointments, :end, :datetime
  end

  def self.down
   change_column :appointments, :start, :date
   change_column :appointments, :end, :date
  end
end
