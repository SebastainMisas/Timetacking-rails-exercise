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
end
