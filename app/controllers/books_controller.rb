class BooksController < ApplicationController
  before_action :find_book, only: [:show,:edit,:destroy,:update]
  def index
    @books=current_user.books
  end

  def show
  end

  def destroy
    @book.destroy

    redirect_to books_path
  end

  def new
    @book=Book.new
  end

  def create
    @book=current_user.books.new(book_params)
    
    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      flash.now[:alert] = "There were errors in your submission."
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book was successfully updated."
    else
      error_message
      render :edit
    end
  end


  private

  def find_book
    @book=Book.find(params[:id])
  end


  def book_params
    params.require(:book).permit(:title, :description, :pages, :book_type ,:author_country,:user_id)
  end


  def error_message
    flash.now[:alert] = "There were errors in your submission."
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
end
