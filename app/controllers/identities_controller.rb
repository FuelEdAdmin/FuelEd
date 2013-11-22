class IdentitiesController < AdminsController
	def new
		user_and_admin_check()
		@identity = env['omniauth.identity']
		puts env['omniauth.identity']
	end

	def index
		user_and_admin_check()
    end

#	def create
#		@identity = Identity.new(params[:identity].permit(:rank, :name, :email, :password, :password_confirmation))
		  
#		@identity.save
#		flash[:alert] = "You have successfully made an account!"
#		redirect_to "/admins"	
#	end

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
