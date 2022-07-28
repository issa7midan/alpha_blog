class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "logged in successfully"
      redirect_to articles_path
    else
      flash.now[:alert] = "There was something wrong with your credentials"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "logged out"
    redirect_to articles_path
  end

end
