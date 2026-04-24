class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create] 

  def new
    @user = User.new
  end
  
  def create
    @user = User.create_or_find_by(user_params)
    if @user.persisted?
      redirect_to new_session_path, notice: "ユーザー登録が完了しました！続けてログインしてください。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    
  end  
   
  def show
  end

  def edit
    @user= User.new
  end
  


private
  
  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation)
  end

end