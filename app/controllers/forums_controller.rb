class ForumsController < ApplicationController

	def index
		@forums = Forum.includes(:topics, :category)
		@forum_groups = @forums.group_by { |f| f.category.name }
	end	

	def new
		@forum = Forum.new
	end

	def show
		@forum = Forum.includes(:topics => [{:replies => :user}, :user]).find(params[:id])
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
