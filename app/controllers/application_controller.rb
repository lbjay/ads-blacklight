require_dependency( 'vendor/plugins/blacklight/app/controllers/application_controller.rb')
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :local_css

  def local_css
    stylesheet_links << "my_local_stylesheet"
  end

end
