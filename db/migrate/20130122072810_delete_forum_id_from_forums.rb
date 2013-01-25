class DeleteForumIdFromForums < ActiveRecord::Migration
  def change
  	remove_column :forums, :forum_id
  end	
end
