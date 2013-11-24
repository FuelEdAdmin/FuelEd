class AdminsController < ApplicationController

	layout "admin"
	before_filter :user_and_admin_check

	def index
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
