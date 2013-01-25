module ForumsHelper
	def current_forum
		@current_forum = Forum.find_by_id(params[:id])
	end	
end
