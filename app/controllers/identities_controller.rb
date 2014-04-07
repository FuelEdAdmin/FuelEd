class IdentitiesController < AdminsController

	def new
   		@schools = []
    		School.all.each do |school|
      			@schools << school.name
    		end
		@identity = env['omniauth.identity']
	end

	def index
	    @all_users = User::USER_TYPES
	    @selected_users = params[:user_types] || session[:user_types] || {}

	    if @selected_users == {}
	      @selected_users = Hash[@all_users.map {|user| [user, user]}]
	    end
    
	    if params[:user_types] != session[:user_types]
	      session[:user_types] = @selected_users
	      redirect_to :user_types => @selected_users and return
	    end
    	# @users = User.find_all_by_rank(@selected_users.keys) 
	    @users = User.paginate(:page => params[:page], :per_page => 5).find_all_by_rank(@selected_users.keys) 


    end

#	def create
#		@identity = Identity.new(params[:identity].permit(:rank, :name, :email, :password, :password_confirmation))
		  
#		@identity.save
#		flash[:alert] = "You have successfully made an account!"
#		redirect_to "/admins"	
#	end
	def show
		@user = User.find_by_uid(params[:id])
		@identity = Identity.find_by_email(@user.email)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:notice] = "User '#{@user.name}' had been deleted."
		redirect_to users_path
	end

end
