module ApplicationHelper

	def markdown text
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
	    no_intra_emphasis: true,
	    fenced_code_blocks: true,
	    disable_indented_code_blocks: true)
	return markdown.render(text).html_safe
	end

	def login_helper style = ''
		if current_user.is_a?(GuestUser)
		    (link_to "Register", new_user_registration_path, class: style) + ' ' +

		    (link_to "Login", new_user_session_path, class: style)
		    else
		    link_to "Logout" + " " + current_user.name, destroy_user_session_path, method: :delete, class: style

		end
	end

	def source_helper
		if session[:source]
    	content_tag(:p, greeting, class: "source-greeting")
		end
	end

	def nav_items
		[
			{
				url: root_path,
				title: 'Home'
			},
			{
				url: about_path,
				title: 'About'
			},
			{
				url: contact_path,
				title: 'Contact'
			},
			{
				url: tech_news_path,
				title: 'Tech News'
			},
			{
				url: blogs_path,
				title: 'Blog'
			},
			{
				url: portfolios_path,
				title: 'Portfolio'
			}
		]
	end

	def nav_helper style , tag_type
		nav_links = ''
		nav_items.each do |item|
			nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item [:title]}</a></#{tag_type}>"
		end


	nav_links.html_safe
	end

	def active? path
		"active" if current_page? path
	end

	def alert_helper

		alerts = (flash[:alert] || flash[:notice] || flash[:error])

		if alerts
			alert_generator alerts
	 	end
	end

	def alert_generator msg
		js add_gritter(msg, title: "Ryan Johnson Portfolio")
	end

end
