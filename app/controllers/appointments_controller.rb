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

	   # want to find by school
	  if current_user.rank == "client"
            @appointments = Appointment.all  #find where school == my school
	    @myappts = nil #find in @appointments where client == me
	  elsif current_user.rank == "intern"
            @appointments = Appointment.all  #find where intern == me
	    @myappts = nil # find where booked != nil
	  else
	    @appointments = Appointment.all
	  end
	end
end
