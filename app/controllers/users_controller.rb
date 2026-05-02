class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create] 
  before_action :correct_user, only: [:edit, :update]


  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      flash[:notice]="Welcome! You have signed up successfully."
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @book = Book.new
    @user = Current.user
    @users=User.all
  end  
   
  def show
    @book= Book.new
    @user= User.find(params[:id])
    @books= @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end


private
  
  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :image, :introduction)
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    if @user.nil? || @user != Current.user
      redirect_to user_path(Current.user)
    end
  end

end