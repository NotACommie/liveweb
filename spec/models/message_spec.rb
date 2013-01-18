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

require 'spec_helper'

describe Message do
  
  let(:user) { FactoryGirl.create(:user) }
  #let(:conversation) { conversation.conversation_id: '1'}
  #before { @message = FactoryGirl.create(:message, user: user) }
  before  { @message = user.conversation.messages.build(content: "Test message") }
  
  subject { @message }

  it { should respond_to(:conversation_id) }
  it { should respond_to(:conversation_starter) }
  it { should respond_to(:reply) }
  it { should respond_to(:subforum_id) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
  	it "should not allow access to user_id" do
  		expect do
  			Message.new(user_id: user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end  

  describe "when user_id is not present" do
  	before { @message.user_id = nil }
  	it { should_not be_valid }
  end	

  describe "when conversation_id is not present" do
    before { @message.conversation_id = nil }
    it { should_not be_valid }
  end
  
  describe "when subforum_id is not present" do
    before { @message.subforum_id = nil }
    it { should_not be_valid }
  end    

  describe "with blank content" do
    before { @message.content = " " }
    it { should_not be_valid }
  end  	
end

