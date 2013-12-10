class ChangeZipcodeType < ActiveRecord::Migration
	def change
  		remove_column :appointments, :zipcode, :string
		add_column :appointments, :zipcode, :integer
	end
end
