# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  layout "default"

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def google_analytics?
    RAILS_ENV == "production"
  end

  def user_locale
    locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    I18n.locale = locale
    I18n.locale.to_s
  end

end
