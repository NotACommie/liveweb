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

require 'spec_helper'

describe Topic do

  let(:user) { FactoryGirl.create(:user) }
  before { @topic = user.topics.build(title: "Test title", content: "Test content") }	

  subject { @topic }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when title is not present" do
  	before { @topic.title = " " }
  	it { should_not be_valid }
  end

  describe "when title is too long" do
    before { @topic.title = "a" * 76 }
    it { should_not be_valid }
  end  

  describe "when content is not present" do
  	before { @topic.content = " " }
  	it { should_not be_valid }
  end
  
  describe "when user_id is not present" do
  	before { @topic.user_id = " " }
  	it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Topic.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end  		

end
