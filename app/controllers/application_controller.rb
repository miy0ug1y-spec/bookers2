class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user, :logged_in?

  private
   
   def after_authentication_url
    books_path
   end
  
   def current_user
    return @current_user if @current_user
    if session[:user_id]
    @current_user = User.find_by(id: session[:user_id]) 
    elsif cookies.encrypted[:user_id] 
      if user
        session[:user_id] = user.id
        @current_user = user
      end   
    end
  end
  
   def logged_in?
    current_user.present?
   end
  
end
