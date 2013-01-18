class AddThreadIdAndSubforumIdToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :thread_id, :integer
  	add_column :messages, :subforum_id, :integer
  end
end
