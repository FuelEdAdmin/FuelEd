class ChangeDateFormatInAppointments < ActiveRecord::Migration
	def change
		remove_column :appointments, :start, :integer
		remove_column :appointments, :end, :integer	
		add_column :appointments, :start, :datetime
		add_column :appointments, :end, :datetime
	end
end
