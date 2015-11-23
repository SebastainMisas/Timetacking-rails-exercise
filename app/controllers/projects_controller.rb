class ProjectsController < ApplicationController
	def index
		
		@projects_list = Project.order(created_at: :desc) 
		render "index"
	end
	def show
		id = params[:id]
		@proj = Project.find_by(id: id)
		
		render "show"
		

	end
	def new
		@project = Project.new
		render "new"
	end
 
	
	def create
		@project = Project.new(project_params)
		if @project.save 
			redirect_to("/projects")
		else
			redirect_to("/404")
		end
	end
# private means none of this information is not accessable outside of the controller
	private
	def project_params
		params.require(:project).permit(:name, :description)
	end
end

