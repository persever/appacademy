
class PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    @posts = Post.all
    render json: @posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end