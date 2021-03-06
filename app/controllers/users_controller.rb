class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Account created!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end			

  def show
  	@user = User.find(params[:id])
  end	

  private

    def signed_in_user
      unless signed_in?
          store_location
          redirect_to signin_url, notice: "Please sign in."
      end
    end

    def current_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
   end  
end
