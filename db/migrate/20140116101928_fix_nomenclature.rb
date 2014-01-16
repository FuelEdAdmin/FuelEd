class FixNomenclature < ActiveRecord::Migration
  def change
  	rename_column :appointments, :intern, :counselor
  	rename_column :appointments, :client, :participant
  end
end
