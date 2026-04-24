class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user

  private
   
   def after_authentication_url
    books_path
   end
  
   def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
   end
  
end
