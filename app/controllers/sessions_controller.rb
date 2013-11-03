class SessionsController < ApplicationController

  def new
  end

	def create
		#puts "REQUEST ENV IS:"
		#puts request.env  #if you want to see all contents of auth hash
  		#auth = request.env["omniauth.auth"] #has hash of info about auth;
  		#puts "FDJSKLF:FDSJFKLDSFJSDLKFJSDLKFJSDLFKSJFLDSK"
  		#if (auth == nil)
  		#	puts "AUTH IS NILL!____________________FJDSLKFJLDSKJ"
  		#else
  		#	puts auth
  		#end
  		puts "CALLING SESSIONS#CREATE"
  		#user = User.from_omniauth(auth)
      user = User.from_omniauth(env["omniauth.auth"])
  		session[:user_id] = user.id
  		redirect_to root_url, notice: "Signed in!"
  		#redirect_to root_url, notice: "Signed in!"
	end

	def destroy
  		session[:user_id] = nil
  		redirect_to root_url notice: "Signed out!"
	end

	def failure
		redirect_to root_url, alert: "Authentication failed, please try again."
	end

end
