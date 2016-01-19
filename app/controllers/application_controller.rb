class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :setLocale
  
  def default_url_options
    {:locale => I18n.locale.to_s}
  end
  
  def setLocale    
    # get language
    I18n.locale = (params[:locale] || :en)
  end
end
