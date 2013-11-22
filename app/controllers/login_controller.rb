class LoginController < ApplicationController
	def index
	  	if not current_user.nil?
		  	if @current_user.rank == "admin"
		 		redirect_to "/admins"
	        end
	        if @current_user.rank == "client" or  @current_user.rank == "intern"		
		 		redirect_to "/appointments"
		 	end
		end
	end
end
