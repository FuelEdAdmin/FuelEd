require 'bcrypt'
class UsersController < ApplicationController

	before_filter :setup_schools

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

	    if !params[:password_digest].nil? 
		    user_identity = Identity.find_by_email(@user.email)
		    unencrypted_password = params[:password_digest].to_s
		    unencrypted_password_confirmation = params[:password_digest_confirm].to_s

		    if unencrypted_password == unencrypted_password_confirmation

			    password_digest = BCrypt::Password.create(unencrypted_password)
			    user_identity.password_digest = password_digest;
			    user_identity.save!
			else
				flash[:warning] = "Password and confirmation did not match."
				flash.keep
				return redirect_to change_password_path
			end
		end

	    if !params[:user].nil?
	    	@user.update_attributes!(params[:user].permit(:name, :email, :bio))
	    end
	    if !params[:school].nil?
	    	new_school = School.find_by_name(params[:school])
		if @user.schools.include? new_school
			flash[:notice] = "#{@user.name} already has this school."
		else
	    		@user.schools << new_school
	    		@user.save
	        	flash[:notice] = "School added to #{@user.name}."
		end
	        flash.keep
	        redirect_to "/admins/identities"
	    else
		    flash[:notice] = "User information successfully updated."
		    flash.keep
                    if (current_user.rank == "participant")
                      return redirect_to "/appointments"
                    else
		      return redirect_to user_path(@user)
                    end
		end

	end

	def add_school
  		@user = User.find_by_uid(params[:id])
	end

    def setup_schools()
        @schools = []
        School.all.each do |school|
            @schools << school.name
        end
    end

	def destroy
		@user = User.find_by_uid(params[:id])
		@user.destroy
		flash[:notice] = "User '#{@user.name}' had been deleted."
		redirect_to "/admins/identities"
	end
end
