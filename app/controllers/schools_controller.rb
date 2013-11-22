class SchoolsController < AdminsController
	def new
		user_and_admin_check()
	end

	def create
		user_and_admin_check()
		@school = School.new(params[:school].permit(:name, :location))
		  
		@school.save
		redirect_to "/admins/schools"
	end

	def show
		user_and_admin_check()
		@school = School.find(params[:id])
	end

	def index
		user_and_admin_check()
		@schools = School.all
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
