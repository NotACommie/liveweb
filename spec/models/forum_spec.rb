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

require 'spec_helper'

describe Forum do

	before { @forum = Forum.new(name: "Example Forum", description: "Example") }

	subject { @forum }

	it { should be_valid }
	it { should respond_to(:name) }
	it { should respond_to(:description) }

	describe "when forum name is not present" do
		before { @forum.name = " " }
		it { should_not be_valid }
	end

	describe "when forum name is already taken" do
		before do
			forum_with_same_name = @forum.dup
			forum_with_same_name.save
		end
		
		it { should_not be_valid }
	end	 	
end
