class ChangeZipcodeType < ActiveRecord::Migration
	def self.up
		change_column :schools, :zipcode, :integer
	end

	def self.down
		change_column :schools, :zipcode, :string
	end
end
