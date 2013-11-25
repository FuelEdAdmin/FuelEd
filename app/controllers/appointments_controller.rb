class AppointmentsController < ApplicationController

	before_filter :user_check

	def new
	end

	def create
		@appointment = Appointment.new

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

		@appointment.client = params[:appointment][:client]
		@appointment.intern = params[:appointment][:intern]
		# @appointment.school = params[:appointment][:school]
		@appointment.date = date
		@appointment.start = start_date
		@appointment.end = end_date

		# @appointment = Appointment.create(params[:appointment].permit(:client, :intern, :school, date, start_date, end_date))
		@appointment.save
		flash[:alert] = "You have successfully made an appointment!"
		redirect_to @appointment	
	end

	def show
		@appointment = Appointment.find(params[:id])
	end

        def edit
    		@appointment = Appointment.find(params[:id])
  	end
	
	def update	
	    @appointment = Appointment.find(params[:id])
	    @appointment.update_attributes!(params[:appointment].permit(:client, :intern, :school, :date, :start, :end))
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
	  	if current_user.rank == "client"
            @appointments = Appointment.all  #find where school == my school and DATE > current date
	    	@myappts = nil #find in @appointments where client == me
	  	elsif current_user.rank == "intern"
            @appointments = Appointment.all  #find where intern == me and DATE > current date
	    	@myappts = nil # find where booked != nil
	  	else
	    	@appointments = Appointment.all
	  	end
	end

	def past
		@appointments = Appointment.all
	  	if current_user.rank == "client"
            @appointments = Appointment.all  # want to find appointments where DATE < current date, and booked my me
	  	elsif current_user.rank == "intern"
            @appointments = Appointment.all  #find where booked != nil and date < current date
	  	end

	end

	def user_check()
		# check for admin privledges 
		if current_user.nil?
            redirect_to root_url
      	end
	end
end
