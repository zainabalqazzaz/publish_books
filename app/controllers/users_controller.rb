class UsersController < ApplicationController
  before_action :find_user , only: [:show,:edit,:destroy,:update]

  def index
    @users=User.all
  end

  def show
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      error_message
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      error_message
      render :edit
    end
  end

  private 

  def find_user
    @user = User.find(params[:id])
  end 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :dob, :ssn, :adress, :linkedin_profil)
  end

  def error_message
    flash.now[:alert] = "There were errors in your submission."
  end

end
