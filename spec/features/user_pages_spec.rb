require 'spec_helper'

describe "User Pages" do

	subject { page }

	describe "sign-up" do
		before { visit signup_path }

		it { should have_selector('h1', text: 'Join') }
		# it { should have_selector('title', text: full_title('Join')) }  FIGURE OUT WHY SIMPLE TEST NO RUN
	end

	describe "user sign-up process" do
		before  {visit signup_path }

		let(:submit) { "Create account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", 			with: "Test User"
				fill_in "Email", 			with: "test@test.com"
				fill_in "Password", 		with: "testpass"
				fill_in "Confirmation", 	with: "testpass"
			end
		
			it "should create a user" do
				expect { click_button submit}.to change(User, :count).by(1)
			end
		end
	end								

	describe "show user page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_selector('h1', text: user.name) }
		# it { should have_selector('title', text:user.name ) }
	end	
end
