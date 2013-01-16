require 'spec_helper'

describe "User Pages" do

	subject { page }

	describe "sign-up page" do
		before { visit signup_path }

		it { should have_selector('h1', text: 'Join') }
		# it { should have_selector('title', text: full_title('Join')) }  FIGURE OUT WHY SIMPLE TEST NO RUN
	end	
end
