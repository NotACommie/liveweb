require 'spec_helper'

describe "Forum Pages" do

	subject { page }

	describe "view individual forum" do
		let(:forum)  {FactoryGirl.create(:forum)}
		
		before {visit forum_path(forum)}

		it {should have_content(forum.name)}
		it {should have_content(forum.description)}

		describe "for signed in user" do
			let(:user) {FactoryGirl.create(:user)}
			before do

				sign_in user
				visit forum_path(forum)

				it {should have_content(user.name)}
			end
		end		
	end	
end
