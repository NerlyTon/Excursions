class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_user_path
      end
  end

  def show
    redirect_if_not_logged_in
    @user = User.find(params[:id])
    redirect_to '/' if !@user
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :username)
  end
  
end
