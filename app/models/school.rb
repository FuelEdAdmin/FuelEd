class School < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :appointments
	#has_and_belongs_to_many :appointments
	
	validates_presence_of :name, :length => { :maximum => 50 }
	validates_presence_of :country, :length => { :maximum => 50 }
	validates_presence_of :state, :length => { :maximum => 20 }
	validates_presence_of :county, :length => { :maximum => 50 }
	validates_presence_of :city, :length => { :maximum => 50 }
	validates_presence_of :address, :length => { :maximum => 50 } 
	validates :zipcode, presence: true, numericality: { only_integer: true }, :inclusion => 0..100000
end
