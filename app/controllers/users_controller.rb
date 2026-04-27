class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create] 

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
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