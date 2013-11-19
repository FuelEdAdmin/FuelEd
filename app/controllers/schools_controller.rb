class SchoolsController < ApplicationController
	def new
	end

	def create
		@school = School.new(params[:school].permit(:name, :location))
		  
		@school.save
		redirect_to "/admin/schools"
	end

	def show
		@school = School.find(params[:id])
	end

	def index
		@schools = School.all
	end
end
