class AppointmentsController < ApplicationController
	def new
		if current_user.nil?
          redirect_to "/identities"
        end
	end

	def create
		if current_user.nil?
<<<<<<< HEAD
                  redirect_to "/identities"
                else
	  	  @appointment = Appointment.create(params[:appointment].permit(:client, :intern, :date, :start, :end))
=======
          redirect_to "/identities"
        end
		@appointment = Appointment.create(params[:appointment].permit(:client, :intern, :school, :date, :start, :end))
>>>>>>> Added school to appointments model and changed appointment views
		  
		  #@appointment.save
		  flash[:alert] = "You have successfully made an appointment!"
		  redirect_to @appointment
                end	
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
