class AppointmentsController < ApplicationController

    before_filter :user_check, :setup_schools, :setup_users

    def new
        @durations = []
        @num_slots = [1, 2, 3, 4, 5]
        @repeats = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        @everys = [1, 2, 3, 4]
        11.times do |x|
            @durations << (10 + (x * 5))
        end
        @my_schools = []
        @current_user.schools.each do |school|
            @my_schools << school.name
        end
    end

    def create

        room = (params[:room])['room']
        repeats = params[:repeat].to_i + 1
        every = params[:every].to_i
        num_slots = params[:num_slots].to_i
        duration = params[:duration].to_i
        school = School.find_by_name(params[:school])

	    year = params[:date_year].to_i
        month = params[:date_month].to_i
        day = params[:date_day].to_i
        hour = params[:start_hour].to_i
        mins = params[:start_minutes].to_i

        
        if (params[:start_tod] == "AM" and params[:start_hour].to_i == 12)
	    orig_start_date = DateTime.new(year, month, day, 0, mins)
	elsif (params[:start_tod] == "PM" and params[:start_hour].to_i != 12)
            orig_start_date = DateTime.new(year, month, day, hour + 12, mins)
        else
            orig_start_date = DateTime.new(year, month, day, hour, mins)
        end
        end_date = nil
        
        repeats.times do |repeat|
            start_date = orig_start_date
            num_slots.times do |slot|
                @appointment = Appointment.new
                @appointment.participant = "" 
                @appointment.counselor = @current_user.name
                @appointment.room = room
                @appointment.school = school
                end_date = (start_date.to_time + duration.minutes).to_datetime
                @appointment.start_time = start_date
                @appointment.end_time = end_date
                @appointment.save
                start_date = end_date
            end
            orig_start_date = (orig_start_date.to_time + every.weeks).to_datetime
        end

        #date = DateTime.new(params[:date_year].to_i.to_i,params[:date_month].to_i,params[:date_day].to_i)


        #if(params[:end_tod] == "PM" and params[:end_hour].to_i != 12)
        #        end_date = DateTime.new(params[:date_year].to_i,params[:date_month].to_i,params[:date_day].to_i, params[:end_hour].to_i + 12, params[:end_minutes].to_i)
        #else
        #        end_date = DateTime.new(params[:date_year].to_i,params[:date_month].to_i,params[:date_day].to_i, params[:end_hour].to_i, params[:end_minutes].to_i)
        #end
    
        flash[:notice] = "You have successfully created the appointment slot(s)!"
        redirect_to "/appointments" #@appointment    
    end

    def show
        @appointment = Appointment.find(params[:id])
    end

    def edit
        @appointment = Appointment.find(params[:id])
      end
    
    def update    
        @appointment = Appointment.find(params[:id])
        date = DateTime.new(params[:date_year].to_i.to_i,params[:date_month].to_i,params[:date_day].to_i)
        if(params[:start_tod] == "PM" and params[:start_hour].to_i != 12)
                start_date = DateTime.new(params[:date_year].to_i,params[:date_month].to_i,params[:date_day].to_i, params[:start_hour].to_i + 12, params[:start_minutes].to_i)
        else
                start_date = DateTime.new(params[:date_year].to_i,params[:date_month].to_i,params[:date_day].to_i, params[:start_hour].to_i, params[:start_minutes].to_i)
        end
        if(params[:end_tod] == "PM" and params[:end_hour].to_i != 12)
                end_date = DateTime.new(params[:date_year].to_i,params[:date_month].to_i,params[:date_day].to_i, params[:end_hour].to_i + 12, params[:end_minutes].to_i)
        else
                end_date = DateTime.new(params[:date_year].to_i,params[:date_month].to_i,params[:date_day].to_i, params[:end_hour].to_i, params[:end_minutes].to_i)
        end
        @appointment.start_time = start_date
        @appointment.end_time = end_date
        @appointment.update_attributes!(params[:appointment].permit(:participant, :counselor, :school, :date, :room))
        redirect_to appointment_path(@appointment)
    end

    def destroy
        @appointments = Appointment.find(params[:id])
        @appointments.destroy
        flash[:notice] = "Appointment deleted."
        redirect_to "/appointments"
    end

    def index
          # want to find by school

        current_date = Time.new
           if @current_user.rank == "participant"
             @appointments = Appointment.paginate(:page => params[:page], :per_page => 5).where(["school_id = ? and start_time >= ? and participant = ?", current_user.schools.first.id, current_date, ""])  #find where school == my school and DATE > current date
           elsif @current_user.rank == "counselor"
             @appointments = Appointment.paginate(:page => params[:page], :per_page => 5).where(["counselor = ? and start_time >= ?", current_user.name, current_date])  #find where counselor == me and DATE > current date
           else
             @appointments = Appointment.paginate(:page => params[:page], :per_page => 5)
           end
          #@appointments = Appointment.paginate(:page => params[:page], :per_page => 5)

    end

    def past

        current_date = Time.new
        @appointments = Appointment.all
          if @current_user.rank == "participant"
            @appointments = Appointment.where(["start_time < ? and participant = ?", "#{current_date}", "#{current_user.name}"])
          elsif @current_user.rank == "counselor"
            @appointments = Appointment.where(["start_time < ? and participant != ? and counselor = ?", "#{current_date}", "", "#{current_user.name}"])
          end

    end

    def book_participant
        @appointment = Appointment.find(params[:id])
        @appointment.participant = @current_user.name
        @appointment.save
        flash[:notice] = "Appointment successfully booked!"
        flash.keep
           redirect_to appointment_path(@appointment)
    end

    def unbook
        @appointment = Appointment.find(params[:id])
        @appointment.participant = ""
        @appointment.save
        flash[:notice] = "Appointment successfully unbooked!"
        flash.keep
           redirect_to appointment_path(@appointment)
    end

    def book_counselor
        @appointment = Appointment.find(params[:id])
        @appointment.participant = params[:participant]
        @appointment.save
        flash[:notice] = "Appointment successfully booked!"
        flash.keep
           redirect_to appointment_path(@appointment)
    end


    def user_check()
        # check for admin privledges 
        if current_user.nil?
            redirect_to root_url
          end
    end

    def setup_schools()
        @schools = []
        School.all.each do |school|
            @schools << school.name
        end
    end

    def setup_users()
        @users = {}
        School.all.each do |school|
		users = school.users.where(["rank = ?", "participant"])
        	@users[school.name] = []
		users.each do |user|
			@users[school.name] << user.name
		end
        end
    end
end
