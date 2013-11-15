class SessionsController < ApplicationController

  def new
  end

	def create
<<<<<<< HEAD
    	user = User.from_omniauth(env["omniauth.auth"], params[:rank])
    	puts "NEW USER ID IS" + user.uid
		if (session[:user_id] == nil) # => wasn't previously logged in
			session[:user_id] = user.uid  # => session id = newly created user's id
			if (user.rank == "admin")
				redirect_to admins_path, notice: "Signed in!"
			else
				redirect_to appointments_path, notice: "Signed in!"  # => go to appt page
			end
=======
    user = User.from_omniauth(env["omniauth.auth"], params[:rank])
    	puts "NEW USER ID IS" + user.uid
		if (session[:user_id] == nil) # => wasn't previously logged in
			session[:user_id] = user.uid  # => session id = newly created user's id
			redirect_to appointments_path, notice: "Signed in!"  # => go to appt page
>>>>>>> changed signup process to reflect admin's creation of intern/client accounts (i.e. don't automatically sign in as newly created account, redirect to userinfo page after new creation, etc.  ALSO school model to include full address information
		else
			redirect_to "/users/#{user.uid}", notice: "User created!"
		end
		#session[:user_id] ||= user.uid
		#redirect_to appointments_path, notice: "Signed in!"
	end

	def destroy
        session[:user_id] = nil
        redirect_to root_url notice: "Signed out!"
	end

	def failure
        redirect_to root_url, alert: "Authentication failed, please try again."
	end

end
