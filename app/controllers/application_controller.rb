class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def reformat_time
    session[:hour_format] == 12 ? session[:hour_format] = 24 : session[:hour_format] = 12
    redirect_back fallback_location: root_path
  end
end
