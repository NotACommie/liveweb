# == Schema Information
#
# Table name: conversations
#
#  id          :integer          not null, primary key
#  subforum_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  message_id  :integer
#

class Conversation < ActiveRecord::Base
  attr_accessible :subforum_id

  has_many :messages
  
  #belongs_to :subforum

  validates :subforum_id, presence: true, numericality: { only_integer: true }
end
