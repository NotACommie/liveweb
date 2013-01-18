class RenameMessagesThreadIdToConversationId < ActiveRecord::Migration
	def change
		change_table :messages do |t|
			t.rename :thread_id, :conversation_id
			t.boolean :conversation_starter
			t.boolean :reply
		end
	end		
end
