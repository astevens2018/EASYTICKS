class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :store_location

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def default_url_options
  { host: ENV["www.easyticks.com"] || "localhost:3000" }
  end

end
