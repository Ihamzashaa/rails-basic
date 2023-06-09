class PasswordResetsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice:"Link is send to email Id"
  end
  def edit
    @user = User.find_signed(params[:token], purpose:"password_reset")
  end
end