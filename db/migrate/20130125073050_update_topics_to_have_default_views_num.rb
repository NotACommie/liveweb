class UpdateTopicsToHaveDefaultViewsNum < ActiveRecord::Migration
	def change
		change_column :topics, :views, :integer, :default => 0
	end	
end
