class ForumsController < ApplicationController

	def index
		@forums = Forum.includes(:category)
	end	

	def new
		@forum = Forum.new
	end

	def show
		@forum = Forum.includes(:topics => :user).find(params[:id])
	end
		
	def create
  		@forum = Forum.new(params[:forum])
  		if @forum.save
  			flash[:success] = "Topic created!"
  			redirect_to root_url
  	else
  		render 'static_pages/help'
  	end
  end			

end
