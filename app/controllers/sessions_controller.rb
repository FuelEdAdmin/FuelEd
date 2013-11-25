class SessionsController < ApplicationController

  def new
  end

	def create
		puts "FJDKSLFJDKLS F DS F  A  DFS  FD FJSD S F DS"
    	user = User.from_omniauth(env["omniauth.auth"], params[:rank])
    	puts "NEW USER ID IS" + user.uid
    	#puts "SESSION ID IS : " + session[:user_id]
		if (session[:user_id].nil?) # => wasn't previously logged in
			session[:user_id] = user.uid  # => session id = newly created user's id
			if (user.rank == "admin")
				redirect_to admins_path, notice: "Signed in!"
			else
				redirect_to appointments_path, notice: "Signed in!"  # => go to appt page
			end
		else
			if (current_user.rank == "admin")
				redirect_to "/admins/identities/#{user.uid}", notice: "User created!"
			else
				redirect_to appointments_path, notice: "Signed in!"
			end

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
