# == Schema Information
#
# Table name: messages
#
#  id                   :integer          not null, primary key
#  content              :string(255)
#  user_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  conversation_id      :integer
#  subforum_id          :integer
#  conversation_starter :boolean
#  reply                :boolean
#

class Message < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  belongs_to :conversation
  

  validates :content, presence: true
  validates :user_id, presence: true
  validates :conversation_id, presence: true
  validates :subforum_id, presence: true
end
