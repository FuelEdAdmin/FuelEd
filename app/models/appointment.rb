class Appointment < ActiveRecord::Base
	belongs_to :school
	belongs_to :user
	validates :client, :presence => true, :length => { :maximum => 50 }
	validates :intern, :presence => true, :length => { :maximum => 50 }
	#validate :valid_dates
	validates :room, :presence => true, :length => { :maximum => 25 }

	# def valid_dates
	# 	start_time = 
	# 	if start_time >= end_time
	# 		self.errors.add :start_time, ' has to be after end time'
	# 	end
 #    end
end
