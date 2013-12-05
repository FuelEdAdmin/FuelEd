class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception


    
    private 

  	def current_user
  		puts "SESSION[:user_id] IS    :"
  		puts session[:user_id]
  		@current_user ||= User.find_by_uid(session[:user_id]) if session[:user_id]
      #@current_user = User.find_by_uid(session[:user_id]) if session[:user_id]
  	end

    def admin_exists
      @admin_exists = User.find_by_rank("admin")
    end
    helper_method :current_user, :admin_exists
end
