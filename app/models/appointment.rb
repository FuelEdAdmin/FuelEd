class Appointment < ActiveRecord::Base
	has_one :school
	# Validates for presence 
	validates :client, :presence => true, :length => { :maximum => 50 }
	validates :intern, :presence => true, :length => { :maximum => 50 }
	validates :date, :presence => true
	validates_numericality_of :start
  	validates_numericality_of :end, :greater_than => :start
	validates :start, :presence => true, :inclusion => 0..2359
	validates :end, :presence => true, :inclusion => 0..2359
end
