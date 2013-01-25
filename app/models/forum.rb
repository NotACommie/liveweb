# == Schema Information
#
# Table name: forums
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :integer
#  topics_count :integer          default(0)
#

class Forum < ActiveRecord::Base
  attr_accessible :name, :description, :category_id

  has_many :topics
  has_many :users
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category_id, presence: true
end
