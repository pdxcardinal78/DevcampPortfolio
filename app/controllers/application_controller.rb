class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = RyanJohnsonCopyRight::Renderer.copyright 'Ryan Johnson', 'All Rights Reserved'

  end

  module RyanJohnsonCopyRight
    class Renderer
      def self.copyright name, message
        "&copy; #{Time.now.year} | <b>#{name}</b> #{message}".html_safe
      end
    end
  end
end


