class Appointment < ActiveRecord::Base
	belongs_to :school
	belongs_to :user
	# validates :participant, :presence => true, :length => { :maximum => 50 }
	# validates :counselor, :presence => true, :length => { :maximum => 50 }
	# #validates_numericality_of :start
 #  	#validates_numericality_of :end, :greater_than => :start
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
	NON_LEAP_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	DAYS = self.populate_days
	YEARS = [Time.new.year, Time.new.year+1]

	HOURS = [1,2,3,4,5,6,7,8,9,10,11,12]
	MINUTES = self.populate_minutes()
	TIME_OF_DAY = ["AM", "PM"]

	def self.daysInMonth(month, year)
		days = nil
		if month == 2 and Date.gregorian_leap?(year)
			days = 29
		else
			days = NON_LEAP_DAYS_IN_MONTH[month]
		end
		return days
	end

	def self.getHoursReport2DArray(schools, start_month, start_year, end_month, end_year)  #called in reports controller
		start_datetime = DateTime.new(start_year, start_month, 1)
		end_datetime = DateTime.new(end_year, end_month, daysInMonth(end_month, end_year))
		appts = []
		schools.each do |name|
			school = School.find_by_name(name)
			appts += Appointment.where(["start >=? and end<=? and school_id=? and participant != ?", "#{start_datetime}", "#{end_datetime}", school, ""]).to_a
		end
		puts "KAJHFLKAJHFKLAJHSDKASDHKJASD"
		puts appts
		#puts Appointment.first.start.to_s
		return appts
	end


	def daysInMonth(month, year)
		days = nil
		if month == 2 and Date.gregorian_leap?(year)
			days = 29
		else
			days = NON_LEAP_DAYS_IN_MONTH[month]
		return days

	end

	def getHoursReport2DArray(schools, start_month, start_year, end_month, end_year)  #called in reports controller
		start_datetime = Datetime.new(start_year, start_month, 1)
		end_datetime = Datetime.new(end_year, end_month, daysInMonth(end_month, end_year))
		appts = []
		for school in schools
			appts += Appointment.where(["start >=? and end<=? and school=?", "#{start_datetime}", "#{end_datetime}", "#{school}"])
		return appts
	end

	def self.getNumPeopleReport2DArray(schools, start_month, start_year, end_month, end_year)
		#Appointments.getNumPeopleReport2DArray(params[:schools], params[:start_month], params[:start_year], params[:end_month], params[:end_year])
	end

end
