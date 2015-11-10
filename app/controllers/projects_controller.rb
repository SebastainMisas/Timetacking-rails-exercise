class ProjectsController < ApplicationController
	def index
		
		@projects_list = Project.order(created_at: :desc) 
		render "index"
	end
	def show
		id = params[:id]
		@proj = Project.find_by(id: id)
		if @proj == nil
			redirect_to("/404")
		else
			render "show"
		end
	end
	def new
		render "new"
	end
 
	
	def create
		project = Project.new(project_params)
		if project.save == true
			redirect_to("/projects")
		else
			redirect_to("/404")
		end
	end
	# private means none of this information is accessable outside of the controller
	private
	def project_params
		params.require(:project).permit(:name, :description)
	end
end
