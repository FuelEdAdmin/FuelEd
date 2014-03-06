class ReportsController < AdminsController

	def index
		@reports = nil
		@all_schools = []
		School.all.each do |school|
			@all_schools << school.name
		end

	    @selected_schools = params[:school_names] || session[:school_names] || {}

	    # if @selected_schools == {}
	    #   @selected_schools = Hash[@all_schools.map {|school| [school, school]}]
	    # end
    
	    # if params[:school_names] != session[:school_names]
	    #   session[:school_names] = @selected_schools
	    #   redirect_to :school_names => @selected_schools and return
	    # end
    	# # @schools = User.find_all_by_rank(@selected_schools.keys) 
	    # @schools = User.paginate(:page => params[:page], :per_page => 5).find_all_by_rank(@selected_schools.keys) 





	   	year = params[:date_year].to_i  #was commentted out in patbranch	
        month = params[:date_month].to_i #was commentted out in patbranch
		@years = (Date.parse("2014-01-01").year..Time.now.year).to_a #array of year numbers [2001, 2002, etc]
		puts(getHoursReport2DArray)

		puts params

	end

	def new
		@all_schools = []
		School.all.each do |school|
			@all_schools << school.name
		end
	end



	def export

		puts "fuck yapwiouerpoiseurpoaisueproiaueporuawpoeriupowaeiurpoawjeporiawpeoriuawpoerupeoiu"
		redirect_to "/admins/reports"     
	end
	
	def getHoursReport2DArray
		Appointments.getHoursReport2DArray(@selected_schools, params[:start_month], params[:start_year], params[:end_month], params[:end_year])
	end

	def getNumPeopleReport2DArray
		Appointments.getNumPeopleReport2DArray(@selected_schools, params[:start_month], params[:start_year], params[:end_month], params[:end_year])
	end

end
