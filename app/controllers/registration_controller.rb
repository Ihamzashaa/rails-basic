class RegistrationController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Sign up success"
    else
      render :new
    end
    end
  private
  def user_params
    params.require(:user).permit(:email, :password, :confirmation_password)
end
end