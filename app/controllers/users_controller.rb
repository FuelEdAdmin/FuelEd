class UsersController < ApplicationController
	def new
	end

	def show
<<<<<<< HEAD
		@user_show_id = current_user.nil? ? "content" : "calendar"
=======
>>>>>>> changed signup process to reflect admin's creation of intern/client accounts (i.e. don't automatically sign in as newly created account, redirect to userinfo page after new creation, etc.  ALSO school model to include full address information
		@user = User.find_by_uid(params[:id])
	end

	def edit
    		@user = User.find_by_uid(params[:id])
<<<<<<< HEAD
		if current_user.nil?
			redirect_to root_url
		end
		if @user.uid != current_user.uid
			flash[:warning] = "cannot edit other users' profile"
			flash.keep
			redirect_to "/appointments"
		end
=======
>>>>>>> changed signup process to reflect admin's creation of intern/client accounts (i.e. don't automatically sign in as newly created account, redirect to userinfo page after new creation, etc.  ALSO school model to include full address information
  	end
	
	def update
		
    @user = User.find_by_uid(params[:id])
    @user.update_attributes!(params[:user].permit(:name, :email, :created_at, :uid))
    redirect_to user_path(@user)

	end
end
