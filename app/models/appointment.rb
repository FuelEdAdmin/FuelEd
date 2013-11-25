class Appointment < ActiveRecord::Base
	# Validates for presence 
	validates :client, :presence => true, :length => { :maximum => 50 }
	validates :intern, :presence => true, :length => { :maximum => 50 }
	validates_numericality_of :start
  	validates_numericality_of :end, :greater_than => :start
	validates :room, :presence => true, :length => { :maximum => 25 }
end
