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

require 'spec_helper'

describe Conversation do
  
  it { should respond_to(:id) }

end
