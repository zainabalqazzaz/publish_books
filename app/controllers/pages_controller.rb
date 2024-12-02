class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @a="this is my first application"
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