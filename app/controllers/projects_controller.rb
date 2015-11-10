class ProjectsController < ApplicationController
	def index
		
		@projects_list = Project.all 
		render "index"
	end
	def show
		id = params[:id]
		@proj = Project.find(id)
	
	end
end
