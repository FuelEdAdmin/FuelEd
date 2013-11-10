class UsersController < ApplicationController
	def new
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
    		@user = User.find(params[:id])
  	end
	
	def update
		
    @user = User.find params[:id]
    @user.update_attributes!(params[:user].permit(:name, :email, :created_at, :uid))
    redirect_to user_path(@user)

	end
end
