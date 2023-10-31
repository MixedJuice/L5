class TopController < ApplicationController
  def main
    render 'top/login_form'
  end

  def login
    @users = User.all
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = params[:uid]
      redirect_to tweets_path
    else
      render 'top/login_form'
    end

  end
  
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end