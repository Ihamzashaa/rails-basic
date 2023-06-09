class SessionsController < ApplicationController
  load_and_authorize_resource
  def new
  end
  def create
    user= User.find_by(emails: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to books_path, notice: "Logged In"
    else
      flash[:alert] = "Invalid user or password"
      render :new
      end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end