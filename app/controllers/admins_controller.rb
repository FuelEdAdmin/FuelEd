class AdminsController < ApplicationController

	def index
		@appointments = Appointment.all # want to find by school
	end
end
