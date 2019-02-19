class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = Like.create({ user_id: current_user.id, post_id: params[:post_id] })
    redirect_to root_path
  end

  # def destroy
  #   @post = Post.find(params[:post_id])
  #   Like.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
  #   redirect_to root_path
  # end

end
