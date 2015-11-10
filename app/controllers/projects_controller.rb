class ProjectsController < ApplicationController
	def index
		
		@projects_ = Project.order(created_at: :desc).limit(10)
		render "index"
	end
end
