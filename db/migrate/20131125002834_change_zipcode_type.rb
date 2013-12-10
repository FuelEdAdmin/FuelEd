class ChangeZipcodeType < ActiveRecord::Migration
	def change
  		remove_column :schools, :zipcode, :string
		add_column :schools, :zipcode, :integer
	end
end
