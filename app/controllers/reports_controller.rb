require 'csv'

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
		@months = (1..12).to_a

	end

	def new
		@all_schools = []
		School.all.each do |school|
			@all_schools << school.name
		end
	end



	def export

	  type = params[:report_type]
	  school_names = ["Date"]
	  all_schools = []
	  School.all.each do |school|
	    all_schools << [school.name, "1"]
	  end
	  selected = params[:school_names] || all_schools
	  selected.each do |school|
	    school_names << school[0]
	  end

	  output = [].to_csv
	
	  if (type == "Clinical Service Hours" || type == "Both")
	    output << [ "Clinical Service Hours" ].to_csv
	    output << school_names.to_csv
	    rows = Appointment.getHoursReport2DArray(selected, params[:start_month].to_i, params[:start_year].to_i, params[:end_month].to_i, params[:end_year].to_i).to_a
	    rows.each do |row|
	      output << row
	    end
	  end

	  if (type == "People Served" || type == "Both")
            if (type == "Both")
	      output << [].to_csv
	      output << [].to_csv
	    end
	    output << [ "People Served" ].to_csv
	    output << school_names.to_csv
	    rows = Appointment.getNumPeopleReport2DArray(selected, params[:start_month].to_i, params[:start_year].to_i, params[:end_month].to_i, params[:end_year].to_i).to_a
	    rows.each do |row|
	      output << row
	    end
	  end

      	  send_data output, :type => "text/csv", :filename => "FuelEdReports_#{type}_#{Time.now.strftime('%b-%d-%Y')}.csv"

		#redirect_to "/admins/reports"     
	end
	
	def getHoursReport2DArray
		Appointment.getHoursReport2DArray(@selected_schools, params[:start_month], params[:start_year], params[:end_month], params[:end_year])
	end

	def getNumPeopleReport2DArray
		Appointment.getNumPeopleReport2DArray(@selected_schools, params[:start_month], params[:start_year], params[:end_month], params[:end_year])
	end

end
