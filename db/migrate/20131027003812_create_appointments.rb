class CreateAppointments < ActiveRecord::Migration
	# validates :client, :presence => true
	# validates :intern, :presence => true
	# validates :start, :presence => true
	# validates :end, :presence => true

	def change
		create_table :appointments do |t|
			t.string :client
			t.string :intern
			t.integer :start
			t.integer :end

			t.timestamps
		end
	end
end
