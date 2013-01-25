class AddRepliesCountToTopics < ActiveRecord::Migration
  def self.up
  	add_column :topics, :replies_count, :integer, :default => 0

  	Topic.reset_column_information
  	Topic.find(:all).each do |t| 
  		Topic.update_counters t.id, :replies_count => t.replies.length
  	end
  end	

  def self.down
  	remove_column :topics, :replies_count
  end
end