class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :subforum_id

      t.timestamps
    end
  end
end
