class AddMessageIdToConversations < ActiveRecord::Migration
  def change
  		add_column :conversations, :message_id, :integer
  end
end
