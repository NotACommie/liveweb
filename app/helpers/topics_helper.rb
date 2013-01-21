module TopicsHelper

	def current_topic
		@current_topic ||= Topic.find_by_id(params[:id])
	end	

end
