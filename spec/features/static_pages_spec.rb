require 'spec_helper'

describe "Static Pages" do

	subject { page }

	describe "Help page" do
		before { visit help_path }

		it { should have_selector('h1', text: 'Help') }
	end	
 
 end
