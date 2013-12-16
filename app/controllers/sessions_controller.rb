class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or root_path
    else
      flash.now[:error] = "帳號、密碼錯誤，或是無此帳號，請重新登入。"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
