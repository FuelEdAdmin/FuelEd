class AppointmentsController < ApplicationController
	def new
	end

	def create
		@appointment = Appointment.new(params[:appointment].permit(:client, :intern, :start, :end))
		  
		@appointment.save
		redirect_to @appointment
	end

	def show
		@appointment = Appointment.find(params[:id])
	end

	def index
		@appointments = Appointment.all
	end
end
