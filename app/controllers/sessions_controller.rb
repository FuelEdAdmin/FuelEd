class SessionsController < ApplicationController
	def create
		#raise request.env["omniauth.auth"].to_yaml  #if you want to see all contents of auth hash
  		auth = request.env["omniauth.auth"] #has hash of info about auth;
  		user = User.from_omniauth(auth)
  		session[:user_id] = user.id
  		redirect_to root_url, :notice => "Signed in!"
  		redirect_to root_url, notice: "Signed in!"
	end

	def destroy
  		session[:user_id] = nil
  		redirect_to root_url, :notice => "Signed out!"
	end
end
