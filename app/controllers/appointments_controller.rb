class AppointmentsController < ApplicationController
	def new
	end

	def create
		@appointment = Appointment.create(params[:appointment].permit(:client, :intern, :date, :start, :end))
		  
		#@appointment.save
		flash[:alert] = "You have successfully made an appointment!"
		redirect_to @appointment	
	end

	def show
		@appointment = Appointment.find(params[:id])
	end

	def index
                if current_user.nil?
                  redirect_to "/users"
                end
                # if user is client, also want to assign @myappts = _____
		@appointments = Appointment.all # want to find by school
	end
end
