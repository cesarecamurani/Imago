class UsersController < ApplicationController
  before_action :authenticate_user!

  def new

  end

  def show
    @posts = current_user.posts.order(created_at: :desc)
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
    params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender)
  end

end
