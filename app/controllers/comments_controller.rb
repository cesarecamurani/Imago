class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:name, :comment))
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    Comment.find_by(post_id: params[:post_id]).destroy
    redirect_to root_path
  end

end
