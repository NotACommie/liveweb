# == Schema Information
#
# Table name: forums
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  forum_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Forum < ActiveRecord::Base
  attr_accessible :name, :description

  validates :name, presence: true, uniqueness: true
end
