class SchoolsController < AdminsController

	def new
	end

	def create
		@school = School.new(params[:school].permit(:name, :address, :city, :state, :county, :country, :zipcode))
		  
		@school.save
		redirect_to "/admins/schools"
	end

	def show
		@school = School.find(params[:id])
	end

	def index
		@schools = School.all
		@schools.each do|school|
  			puts "Hello #{school.name}"
		end
	end

	def destroy
		@schools = School.find(params[:id])
		@schools.destroy
		flash[:notice] = "School '#{@schools.name}' deleted."
		redirect_to schools_path
	end
	
	def edit
		@school = School.find(params[:id])
	end

	def update
		@school = School.find(params[:id])
    		@school.update_attributes!(params[:school].permit(:name, :address, :city, :state, :county, :country, :zipcode))
   		redirect_to schools_path
	end
end
