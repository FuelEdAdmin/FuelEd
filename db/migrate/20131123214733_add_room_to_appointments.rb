class AddRoomToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :room, :string
  end
end
