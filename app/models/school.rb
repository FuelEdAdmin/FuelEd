class School < ActiveRecord::Base
	has_and_belongs_to_many :users
	#has_and_belongs_to_many :appointments
end
