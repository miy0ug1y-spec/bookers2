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
    @book= Book.new
    @user= Current.user
    @users=User.all
  end  
   
  def show
    @book= Book.new
    @user= Current.user
    @books= Book.all
  end

  def edit
    @user= Current.user
  end
  
  def update
    @user = Current.user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end


private
  
  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :image, :introduction)
  end

end