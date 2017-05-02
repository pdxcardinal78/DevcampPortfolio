module DefaultPageContent
	extend ActiveSupport::Concern

	included do

		before_filter :set_page_content

  def set_page_content
  	@page_title = "DevcampPortfolio | My Portfolio"
  	@seo_keywords = "Ryan Johnson"
  end
	
	end
end
