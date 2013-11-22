class AppointmentsController < ApplicationController
	def new
		user_check()
	end

	def create
		user_check()
		@appointment = Appointment.create(params[:appointment].permit(:client, :intern, :school, :date, :start, :end))
		#@appointment.save
		flash[:alert] = "You have successfully made an appointment!"
		redirect_to @appointment	
	end

	def show
		user_check()
		@appointment = Appointment.find(params[:id])
	end

	def index
      	user_check()
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

	def user_check()
		# check for admin privledges 
		if current_user.nil?
            redirect_to "/identities"
      	end
	end
end
