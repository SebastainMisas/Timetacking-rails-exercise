class ProjectsController < ApplicationController
	def index
		
		@projects_list = Project.order(created_at: :desc) 
		render "index"
	end
	def new
		@project = Project.new
		render "new"
	end
 
	
	def create
		@project = Project.new(project_params)
		if @project.save
			flash[:notice] = "Project was created succesfully" 
			redirect_to("/projects")
		else
			redirect_to("/new")
		end
	end
	def edit
		id = params[:id]
		@project = Project.find_by(id: id)
		if @project == nil
			redirect_to("/404")
		else
			render "edit"
		end

	end
	def update
		id = params[:id]
		@project = Project.find_by(id: id)
		if @project == nil
			redirect_to("/404")
		else
			if @project.update(project_params)
				flash[:notice] = "Project updated succesfully"
				redirect_to "/projects"
			else
				render("edit")
			end
		end
	end
	def destroy
		id = params[:id]
		@project = Project.find_by(id: id)
		if @project.destroy
			flash[:notice] = "Project was succesfully deleted"
			redirect_to "/projects"
		end
	end

# private means none of this information is not accessable outside of the controller
	private
	def project_params
		params.require(:project).permit(:name, :description)
	end
end

