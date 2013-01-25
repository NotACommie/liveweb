class AddTopicCountToForums < ActiveRecord::Migration
  def self.up
  	add_column :forums, :topics_count, :integer, :default => 0

  	Forum.reset_column_information
  	Forum.find(:all).each do |f| 
  		Forum.update_counters f.id, :topics_count => f.topics.length
  	end
  end	

  def self.down
  	remove_column :forums, :topics_count
  end
end
