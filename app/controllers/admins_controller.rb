class AdminsController < ApplicationController

	layout "admin"

	def index
		#user_and_admin_check()
		@appointments = Appointment.all # want to find by school
	end

	def user_and_admin_check()
		if current_user.nil?
            redirect_to "/identities"
      	end
		if not current_user.nil?
			if not @current_user.rank == "admin"
				redirect_to root_url
		    end
		end
	end
end
