class BooksController < ApplicationController

  def index
    @book= Book.new
    @user= Current.user
    @books= Book.all
  end

  def show
  end

  def edit
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end



private
 def book_params
  params.require(:list).permit(:title, :body)
 end

end
