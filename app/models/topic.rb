# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user
  
  has_many :replies

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
