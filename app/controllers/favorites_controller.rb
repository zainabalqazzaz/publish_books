class FavoritesController < ApplicationController

  def create
    current_book = Book.find(params[:book_id])
    Favorite.create!(user:current_user, book:current_book)
    redirect_to root_path, notice: "book added to favorites"
  end


  def destroy
    current_user.favorites.find_by(book_id: params[:book_id]).destroy
    redirect_to root_path, notice: "book removed from favorites"
  end


  def index
    @favorites = current_user.favorite_books.page(params[:page]).per(9)
  end

end
