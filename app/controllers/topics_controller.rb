class TopicsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create]

  def index
  end

  def create
  	@topic = current_user.topics.build(params[:topic])
  	if @topic.save
  		flash[:success] = "Topic created!"
  		redirect_to root_url
  	else
  		render 'static_pages/help'
  	end
  end			

  def new
  	@topic = Topic.new
  end

  def show
  	@topic = Topic.find(params[:id])  
  end

  def reply
    @reply = current_user.replies.create(params[:id])
    render 'reply_form'
  end  	
end
