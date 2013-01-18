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

require 'spec_helper'

describe Reply do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:topic) { Topic.create(topic_id: "1") }
  before  { @reply = user.replies.build(content: "Test reply", title: "Test title") }
  
  subject { @reply }

  it { should respond_to(:topic_id) }
  it { should respond_to(:content) }
  it { should respond_to(:title) }
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
  	before { @reply.user_id = nil }
  	it { should_not be_valid }
  end	

  describe "when topic_id is not present" do
    before { @reply.topic_id = nil }
    it { should_not be_valid }
  end
     
  describe "with blank content" do
    before { @reply.content = " " }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @reply.title = " " }
    it { should_not be_valid } 
  end   	
end

