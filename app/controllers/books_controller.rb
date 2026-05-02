class BooksController < ApplicationController
 before_action :correct_book_user, only: [:edit, :update, :destroy]


  def index
    @book= Book.new
    @user= Current.user
    @books= Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user= @book.user
    @new_book = Book.new
    @books = Book.where(user_id: Current.user.id)
  end

  def edit
    @book= Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = Current.user.id
    if @book.save
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book)
    else
      @books = Book.all
      @user = Current.user
      render "books/index", status: :unprocessable_entity
    end
  end

  def new
    @book = Book.new
    @user =User.new
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private
 def book_params
  params.require(:book).permit(:title, :body)
 end

 def correct_book_user
  @book = Book.find(params[:id])
  unless @book.user == Current.user
    redirect_to books_path
  end
 end
end
