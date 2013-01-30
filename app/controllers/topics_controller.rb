class TopicsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create]

  def create
  	@topic = current_user.topics.build(params[:topic])
    @topic.forum_id = params[:forum_id]
  	if @topic.save
  		flash[:success] = "Topic created!"
  		redirect_to root_url
  	else
  		render 'static_pages/help'
  	end
  end			

  def new
    @forum = Forum.find(params[:forum_id])
  	@topic = @forum.topics.new
  end

  def show
  	@topic = Topic.includes(:replies).find(params[:id])
    @topic.views += 1
    @topic.save
    @reply = @topic.replies.new  
  end
end
