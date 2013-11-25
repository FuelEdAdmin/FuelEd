class Appointment < ActiveRecord::Base
	belongs_to :school
	belongs_to :user

	# Validates for presence 
	validates :client, :presence => true, :length => { :maximum => 50 }
	validates :intern, :presence => true, :length => { :maximum => 50 }
	# validates :date, :presence => true
	# validates_numericality_of :start
 #  	validates_numericality_of :end, :greater_than => :start
	# validates :start, :presence => true, :inclusion => 0..2359
	# validates :end, :presence => true, :inclusion => 0..2359
	# validates :room, :presence => true, :length => { :maximum => 25 }



	def self.populate_minutes()
		array = []
		61.times do |x|
			array << format("%02d", x)
		end
		array
	end

	def self.populate_days()
		array = []
		32.times do |x|
			array << x
		end
		array.delete(0)
		array
	end

	MONTHS = [1,2,3,4,5,6,7,8,9,10,11,12]
	DAYS = self.populate_days
	YEARS = [Time.new.year, Time.new.year+1]

	HOURS = [1,2,3,4,5,6,7,8,9,10,11,12]
	MINUTES = self.populate_minutes()
	TIME_OF_DAY = ["AM", "PM"]



end
