class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        flash[:message] = "Wrong email/password. Please try again."
        redirect_to login_path
      end
  end

  def welcome
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  def google
    # byebug
    @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
      user.name= auth["info"]["first_name"]
      user.password= SecureRandom.hex(8)
    end
    # byebug
    if @user && @user.id
      # byebug
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
