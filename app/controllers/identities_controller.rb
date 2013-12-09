class IdentitiesController < AdminsController

	def new
   		@schools = []
    	School.all.each do |school|
      		@schools << school.name
    	end
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
	def show
		@user_show_id = current_user.nil? ? "content" : "calendar"
		@user = User.find_by_uid(params[:id])
	end

end
