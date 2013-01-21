class ChangeTopicContentToTextType < ActiveRecord::Migration
 	def change
 		remove_column :topics, :content
 		add_column :topics, :content, :text
 	end	
end
