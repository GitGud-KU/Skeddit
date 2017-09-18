class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Toggle the hour format to the opposite of what it was, then reload current page.
  # PRE: None
  # POST: Time is formatted to :hour_format format
  def reformat_time
    session[:hour_format] == 12 ? session[:hour_format] = 24 : session[:hour_format] = 12
    redirect_back fallback_location: root_path
  end
end
