class EntriesController < ApplicationController
	def index
		id = params[:project_id]
		@project = Project.find_by(id: id)
		if @project == nil
			redirect_to("/404")
		else
			@entries = @project.entries
			render "index"
		end

	end
	def new
		id = params[:project_id]
		@project = Project.find_by(id: id)
		@entries = @project.entries.new
		render "new"

	end
	def create 
		id = params[:project_id]
		@project = Project.find_by(id: id)
		@entries = @project.entries.new(entry_params)
		if @entries.save
			flash[:notice] = "Entry created succesfully"
			redirect_to("/projects/#{@project.id}/entries")
		else
			render "new"
		end
	end
	def edit
		prog_id = params[:project_id]
		entry_id = params[:id]
		@project = Project.find_by(id: prog_id)
		if @project == nil
			redirect_to("/404")
		else
			@entries = @project.entries.find_by(id: entry_id)
			if @entries == nil
				redirect_to("/404")
			else
				render "edit"
			end
		end
		
	end
	def update
		prog_id = params[:project_id]
		entry_id = params[:id]
		@project = Project.find_by(id: prog_id)
		if @project == nil
			redirect_to("/404")
		else
			@entries = @project.entries.find_by(id: entry_id)
			if @entries == nil
				redirect_to("/404")
			else 
				if  @entries.update(entry_params)
					flash[:notice] = "Entry Updated succesfully"
					redirect_to "/projects/#{@project.id}/entries"
				else
					render("edit")
				end
			end
		end
	end
	def destroy
		prog_id = params[:project_id]
		entry_id = params[:id]
		@project = Project.find_by(id: prog_id)
		if @project == nil
			redirect_to("/404")
		else
			@entries = @project.entries.find_by(id: entry_id)
			if @entries == nil
				redirect_to("/404")
			else 
				if @entries.destroy
					flash[:notice] = "Entry was successfuly deleted"
					redirect_to "/projects/#{@project.id}/entries"
				end
			end
		end
	end

	private
	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end
end
