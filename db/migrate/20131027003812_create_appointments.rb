class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :client
      t.string :intern

      t.timestamps
    end
  end
end
