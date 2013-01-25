class DeleteGroupIdFromForums < ActiveRecord::Migration
	def change
		remove_column :forums, :group_id
		add_column :forums, :category_id, :integer
	end	
end
