# == Schema Information
#
# Table name: topics
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  content       :text
#  forum_id      :integer
#  views         :integer          default(0)
#  replies_count :integer          default(0)
#

class Topic < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user
  belongs_to :forum, :counter_cache => true

  has_many :replies

  validates :title, presence: true, length: { maximum: 75 }
  validates :content, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
  validates :forum_id, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
end
