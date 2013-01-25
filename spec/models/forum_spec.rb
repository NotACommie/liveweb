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

require 'spec_helper'

describe Forum do

	let(:category) {FactoryGirl.create(:category)}
	before { @forum = category.forums.build(name: "Test Forum", description: "Test Description") }

	subject { @forum }

	it { should be_valid }
	it { should respond_to(:name) }
	it { should respond_to(:description) }
	it { should respond_to(:topics_count) }

	describe "when name is not present" do
		before { @forum.name = " " }
		it { should_not be_valid }
	end

	describe "when name is already taken" do
		before do
			forum_with_same_name = @forum.dup
			forum_with_same_name.save
		end
		
		it { should_not be_valid }
	end	

	describe "when description is not present" do
		before { @forum.description =" " }
		it {should_not  be_valid}
	end	

	describe "when category id is not present" do
		before { @forum.category_id = " " }
		it {should_not be_valid} 
	end		
end
