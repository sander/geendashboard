class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def message
    @user = User.find params[:id]

    UserMailer.personal_message({ to: @user, from: current_user }).deliver

    @message = 'Your message has been sent!'
    render 'show'
  end
end
