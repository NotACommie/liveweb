require 'spec_helper'

describe "Topic Pages" do

	subject { page }

	describe "view topic" do
		let(:topic) { FactoryGirl.create(:topic) }
		before { visit topic_path(topic) }

		# it { should have_text('View topic') }

		describe "for signed-in users" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				sign_in user
				visit topic_path(topic)

				it { should have_field('title') }
				it { should have_field('content') }
				it { should have_button('Submit reply') }
			end
		end
	end				
end
