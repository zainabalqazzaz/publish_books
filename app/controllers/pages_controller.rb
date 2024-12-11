class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @all_books=Book.page(params[:page]).per(9)
    @recent_books=Book.where("created_at >= ?", 100.hours.ago).page(params[:page]).per(9)
  end

  def about 
  end 

  def about_me
    @name="zainab"
    @email="zainab@gmail.com"
  end

  def edit_each

  end

  def info_page
    @info="include all info about the pages"
  end

  def sign_in
    @login="user name"
    @pass="password"
  end

end