class AdminsController < ApplicationController

	layout "admin"
	before_filter :user_and_admin_check

	def index
		@appointments = Appointment.paginate(:page => params[:page], :per_page => 5) # want to find by school
	end

	def user_and_admin_check()
		if current_user.nil?
			if admin_exists #check to see if an admin even exists yet
        		redirect_to root_url and return
       			end
      		end
		if not current_user.nil?
			if not current_user.rank == "admin"
				redirect_to "/appointments"
		    end
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:notice] = "User '#{@user.name}' had been deleted."
		redirect_to users_path
	end
end
