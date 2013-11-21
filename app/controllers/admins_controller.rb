class AdminsController < ApplicationController

	layout "admin"

	def index
		@appointments = Appointment.all # want to find by school
	end
end
