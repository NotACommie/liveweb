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

