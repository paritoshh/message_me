class SessionsController < ApplicationController

  before_action :define_logged_in_redirect, only: [:new, :create]
  def new


  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Login successful!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = 'Login failed!'
      render 'new'
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logout successful!"
    redirect_to login_path
  end


  private

  def define_logged_in_redirect
    if logged_in?
      flash[:alert] = "You are already logged in!"
      redirect_to root_path
    end
  end
end