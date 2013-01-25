module ApplicationHelper
#Returns the full page title on a per-page basis
	def full_title(page_title)
		base_title = "Live-Web"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def nav_thing
		@Category_List ||= Forum.find(:all, :include => :category)
	end			
end
