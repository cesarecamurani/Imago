class PostsController < ApplicationController

  def new

  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:id])
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:description, :image, :user_id)
  end
end
