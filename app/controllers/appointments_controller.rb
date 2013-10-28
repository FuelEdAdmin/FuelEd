class AppointmentsController < ApplicationController
	def new
	end

	def create
		@appointment = Appointment.new(params[:appointment].permit(:client, :intern, :date, :start, :end))
		  
		@appointment.save
		flash[:alert] = "You have successfully made an appointment!"
		redirect_to @appointment
	end

	def show
		@appointment = Appointment.find(params[:id])
	end

	def index
		@appointments = Appointment.all
	end
end
