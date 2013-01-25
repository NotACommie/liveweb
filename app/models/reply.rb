# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255)
#  user_id    :integer
#  topic_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reply < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user
  belongs_to :topic, :counter_cache => true

  validates :content, presence: true
  validates :title, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :topic_id, presence: true, numericality: { only_integer: true }
end
