class BooksController < ApplicationController

  def index
    @book= Book.new
    @user= Current.user
    @books= Book.all
  end

  def show
    @book= Book.new
    @user= Current.user
    @books= Book.all
  end

  def edit
    @book= Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def new
    @book = Book.new
    @user =User.new
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

end
