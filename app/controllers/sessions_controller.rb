class SessionsController < ApplicationController

  def new
  end

	def create

    user = User.from_omniauth(env["omniauth.auth"], params[:rank])
    	puts "NEW USER ID IS" + user.uid
		if (session[:user_id] == nil) # => wasn't previously logged in
			session[:user_id] = user.uid  # => session id = newly created user's id
			redirect_to appointments_path, notice: "Signed in!"  # => go to appt page
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
