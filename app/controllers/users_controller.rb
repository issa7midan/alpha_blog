class UsersController < ApplicationController
  before_action :set_user, only: [:sohw, :edit, :update]
  def show

  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def destroy
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User is updated"
      redirect_to articles_path
    else
      render 'edit'
  end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
