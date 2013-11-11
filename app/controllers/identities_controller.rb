class IdentitiesController < ApplicationController
	def new
		@identity = env['omniauth.identity']
	end

	def index
		# if not current_user.nil?
  #         redirect_to "/appointments"
  #       end
    end
end
