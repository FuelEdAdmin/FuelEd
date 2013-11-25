class ChangeDateFormatInAppointments < ActiveRecord::Migration
  def self.up
   change_column :appointments, :start, :datetime
   change_column :appointments, :end, :datetime
  end

  def self.down
   change_column :appointments, :start, :integer
   change_column :appointments, :end, :integer
  end
end
