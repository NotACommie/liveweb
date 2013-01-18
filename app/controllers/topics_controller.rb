class TopicsController < ApplicationController
  before_filter :signed_in_user

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
end
