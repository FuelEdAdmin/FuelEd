class AppointmentsController < ApplicationController
	def new
		if current_user.nil?
          redirect_to "/identities"
        end
	end

	def create
		if current_user.nil?
			redirect_to "/identities"
        end
		@appointment = Appointment.create(params[:appointment].permit(:client, :intern, :school, :date, :start, :end))
		#@appointment.save
		flash[:alert] = "You have successfully made an appointment!"
		redirect_to @appointment	
	end

	def show
		if current_user.nil?
            redirect_to "/identities"
        end
		@appointment = Appointment.find(params[:id])
	end

	def index
		if current_user.nil?
        	redirect_to "/identities"
        end
        # if user is client, also want to assign @myappts = _____

		@appointments = Appointment.all # want to find by school
	end
end
