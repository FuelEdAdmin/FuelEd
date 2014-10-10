class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

    private 

  	def current_user
  		@current_user ||= User.find_by_uid(session[:user_id]) if session[:user_id]
      #@current_user = User.find_by_uid(session[:user_id]) if session[:user_id]
  	end

    def booked_appts
      current_date = Time.new
      if @current_user.rank == "participant"
	    	@myappts = Appointment.where(["start_time >= ? and participant = ?", "#{current_date}", "#{current_user.name}"]).limit(3)
	    elsif @current_user.rank == "counselor"
	    	@myappts = Appointment.where(["start_time >= ? and participant != ? and counselor = ?", "#{current_date}", "", "#{current_user.name}"]).limit(3)
	    else
        @myappts = Appointment.all.limit(3)
      end
      @myappts
    end

    def admin_exists
      @admin_exists = User.find_by_rank("admin")
    end
    helper_method :current_user, :admin_exists, :booked_appts
end
