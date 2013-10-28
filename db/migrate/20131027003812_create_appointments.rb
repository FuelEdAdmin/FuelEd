class CreateAppointments < ActiveRecord::Migration
	def up
		create_table :appointments do |t|
			t.string :client
			t.string :intern
			t.string :date
			t.integer :start
			t.integer :end

			t.timestamps
		end
	end

  def down
    drop_table :appointments
  end

end
