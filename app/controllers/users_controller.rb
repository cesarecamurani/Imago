class UsersController < ApplicationController
  before_action :authenticate_user!

  def new

  end

  def create
    User.create(user_params)

    redirect_to root_path
  end

  def show
    @user  = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  def destroy
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_back(fallback_location: root_path)
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :website, :bio, :email, :avatar)
  end

end
