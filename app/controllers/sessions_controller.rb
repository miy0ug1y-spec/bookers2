class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new

  end


  def create
    if (user = User.find_by(name: params[:name]))&.authenticate(params[:password])
      #session[:user_id] = user.id
    #if  params[:remember_me] == "1"
     #   cookies.permanent.encrypted[:user_id] = user.id
    #end
      start_new_session_for user
      redirect_to user_path(Current.user)
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
end

 def find_user_from_cookie
    if user_id=cookies.encrypted[:user_id]
      User.find_by(id: user_id)
    end
   end