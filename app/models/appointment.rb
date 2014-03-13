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
		#we want to get an array of rows where each row corresponds to a month, and the elements of each row are the number of hours booked per school

		start_datetime = DateTime.new(start_year, start_month, 1)
		end_datetime = DateTime.new(end_year, end_month+1, 1)
		
		this_month = start_datetime
		next_month = start_datetime + 1.month #initialize next month to be first month after 
		months_to_iter_over = (end_datetime.year * 12 + end_datetime.month) - (start_datetime.year * 12 + start_datetime.month)

		table = {}

		months_to_iter_over.times do
			this_entry_name = this_month.month.to_s + "/" + this_month.year.to_s
			table[this_entry_name] = {}

			schools.each do |school_name|
				table[this_entry_name][school_name[0]] = {}
				school = School.find_by_name(school_name[0])
				appts = Appointment.where(["start >=? and end<=? and school_id=? and participant != ?", "#{this_month}", "#{next_month}", school, ""]).to_a
				num_hours = 0

				appts.each do |appt|
					num_hours+= ((appt.end - appt.start)/3600)
				end

				table[this_entry_name][school_name[0]] = num_hours
			end

			this_month = this_month + 1.month
			next_month = next_month + 1.month
		end
		puts("||||  HOURS REPORT TABLE: ||||")
		puts table

		output = []
		table.each do |month, schools|
			puts "SCHOOLS"
			puts schools
			array = [month]
			schools.each do |school_name, hours|
				puts "SCHOOL Name"
				puts school_name
				puts "SCHOOL Name Hours"
				puts hours
				array << hours
			end
			puts "ARRAY"
			puts array.to_csv
			output << array.to_csv
		end

		puts("||||  HOURS OUTPUT CSV: ||||")
		puts output
		return output
	end


	def daysInMonth(month, year)
		days = nil
		if month == 2 and Date.gregorian_leap?(year)
			days = 29
		else
			days = NON_LEAP_DAYS_IN_MONTH[month]
		end
		return days

	end


	def self.getNumPeopleReport2DArray(schools, start_month, start_year, end_month, end_year)

		start_datetime = DateTime.new(start_year, start_month, 1)
		end_datetime = DateTime.new(end_year, end_month+1, 1)
		
		this_month = start_datetime
		next_month = start_datetime + 1.month #initialize next month to be first month after 
		months_to_iter_over = (end_datetime.year * 12 + end_datetime.month) - (start_datetime.year * 12 + start_datetime.month)

		table = {}

		months_to_iter_over.times do
			this_entry_name = this_month.month.to_s + "/" + this_month.year.to_s
			table[this_entry_name] = {}

			schools.each do |school_name|
				table[this_entry_name][school_name[0]] = {}
				school = School.find_by_name(school_name[0])
				appts = Appointment.where(["start >=? and end<=? and school_id=? and participant != ?", "#{this_month}", "#{next_month}", school, ""]).to_a
				unique_person = {}
				appts.each do |appt|
					unique_person[appt.participant] = true
				end

				table[this_entry_name][school_name[0]] = unique_person.keys.length
			end

			this_month = this_month + 1.month
			next_month = next_month + 1.month
		end
		puts("||||  HOURS REPORT TABLE: ||||")
		puts table

		output = []
		table.each do |month, schools|
			puts "SCHOOLS"
			puts schools
			array = [month]
			schools.each do |school_name, people|
				puts "SCHOOL Name"
				puts school_name
				puts "SCHOOL Name peoples"
				puts people
				array << people
			end
			puts "ARRAY"
			puts array.to_csv
			output << array.to_csv
		end

		puts("||||  HOURS OUTPUT CSV: ||||")
		puts output
		return output
	end

end
