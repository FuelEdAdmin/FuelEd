class IdentitiesController < ApplicationController
	def new
		@identity = env['omniauth.identity']
		puts env['omniauth.identity']
	end
end
