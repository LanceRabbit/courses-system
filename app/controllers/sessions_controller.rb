class SessionsController < ApplicationController
  def new
    redirect_to admin_root_path and flash[:notice] = '已登入' if current_user
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user&.authenticate(params[:session][:password])
      flash[:notice] = '登入成功'
      session[:user_id] = user.id
      redirect_to admin_root_path
    else
      flash[:alert] = '錯誤的電子信箱或密碼'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = '登出成功'
    redirect_to login_path
  end
end
