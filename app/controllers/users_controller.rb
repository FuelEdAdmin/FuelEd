class UsersController < ApplicationController
	def new
	end

	def show
		@user_show_id = current_user.nil? ? "content" : "calendar"
		@user = User.find_by_uid(params[:id])
	end

	def edit
    		@user = User.find_by_uid(params[:id])
		if current_user.nil?
			redirect_to root_url
		end
		if @user.uid != current_user.uid
			flash[:warning] = "cannot edit other users' profile"
			flash.keep
			redirect_to "/appointments"
		end
  	end
	
	def update
		
    @user = User.find_by_uid(params[:id])
    @user.update_attributes!(params[:user].permit(:name, :email, :created_at, :uid))
    redirect_to user_path(@user)

	end
end
