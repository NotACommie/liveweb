class RepliesController < ApplicationController
  before_filter :signed_in_user

  def new
  	@topic = Topic.find(params[:topic_id])
  	@reply = Topic.reply.create
  end

  def show
    @reply = Reply.find_by_id(params[:topic_id] )
  end  

  def create
  	@topic = Topic.find_by_id(params[:topic_id])
  	@reply = @topic.replies.build(params[:reply])
  	@reply.user_id = current_user.id
  	if @reply.save
  		flash[:success] = "Reply created!"
  		redirect_to root_url
  	else
  		render 'static_pages/help'
  	end
  end			
end
