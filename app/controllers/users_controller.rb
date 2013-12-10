require 'bcrypt'
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

  	def change_password 
  		@user = User.find_by_uid(current_user.uid)
  	end
	
	def update
		
    @user = User.find_by_uid(params[:id])

    user_identity = Identity.find_by_email(@user.email)
    unencrypted_password = params[:password_digest].to_s
    unencrypted_password_confirmation = params[:password_digest_confirm].to_s

    puts unencrypted_password_confirmation
    puts unencrypted_password
    puts "foasdpfoaisudproiaweurpoaeisurpoaseiurpoi"

    if unencrypted_password == unencrypted_password_confirmation

	    password_digest = BCrypt::Password.create(unencrypted_password)
	    user_identity.password_digest = password_digest;
	    user_identity.save!

	    if !params[:user].nil?
	    	@user.update_attributes!(params[:user].permit(:name, :email, :bio))
	    end

	    flash[:notice] = "User information successfully updated."
	    flash.keep
	    redirect_to user_path(@user)
	else
		flash[:warning] = "Password and confirmation did not match."
		flash.keep
		redirect_to change_password_path
	end



	end
end
