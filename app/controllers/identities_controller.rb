class IdentitiesController < AdminsController
	def new
		@identity = env['omniauth.identity']
		puts env['omniauth.identity']
	end

	def index

    	end

#	def create
#		@identity = Identity.new(params[:identity].permit(:rank, :name, :email, :password, :password_confirmation))
		  
#		@identity.save
#		flash[:alert] = "You have successfully made an account!"
#		redirect_to "/admins"	
#	end
end
