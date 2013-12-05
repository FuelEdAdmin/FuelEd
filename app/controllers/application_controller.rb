class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception


    @schools = []
    School.all.each do |school|
      @schools << school.name
    end
    private 

  	def current_user
  		puts "SESSION[:user_id] IS    :"
  		puts session[:user_id]
  		@current_user ||= User.find_by_uid(session[:user_id]) if session[:user_id]
      #@current_user = User.find_by_uid(session[:user_id]) if session[:user_id]
  	end

    def booked_appts
      current_date = Time.new
      if @current_user.rank == "client"
	    	@myappts = Appointment.where(["start >= ? and client = ?", "#{current_date}", "#{current_user.uid}"])
	    elsif @current_user.rank == "intern"
	    	@myappts = Appointment.where(["start >= ? and client != ?", "#{current_date}", ""])
	    end
      @myappts
    end

    def admin_exists
      @admin_exists = User.find_by_rank("admin")
    end
    helper_method :current_user, :admin_exists, :booked_appts
end
