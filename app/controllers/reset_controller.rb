require 'bcrypt'
class ResetController < ApplicationController

	def index
	end

	def execute

	    muffins = params[:muffins].to_s
	    real_muffins = "\"YQ.T*{V-7!h,2py~2],M{MqO=-Xa;{BWaj&C5`F?0R,Z$+PxE||{WA)~3F=Yw5T"

	    if muffins != real_muffins
	        return redirect_to root_url
            end

	    user_identity = Identity.find_by_email(params[:email])
	    if user_identity.nil?
		flash[:warning] = "Invalid Email"
		flash.keep
		return redirect_to reset_path
	    end
	

	    if !params[:password_digest].nil? 
		    unencrypted_password = params[:password_digest].to_s
		    unencrypted_password_confirmation = params[:password_digest_confirm].to_s

		    if unencrypted_password == unencrypted_password_confirmation

			    password_digest = BCrypt::Password.create(unencrypted_password)
			    user_identity.password_digest = password_digest;
			    user_identity.save!
				flash[:warning] = "Password has been reset."
				flash.keep
			    return redirect_to root_url
			else
				flash[:warning] = "Password and confirmation did not match."
				flash.keep
				return redirect_to reset_path
			end
		end

	end

end
