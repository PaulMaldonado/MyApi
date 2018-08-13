class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    posts = Post.all
    render json: posts
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: post
    else
      render json: { errors: post.errors }, status: 422
    end
  end

  def update
    @post = Post.new(post_params)

    if @post.save
      render json: post
    else
      render json: { errors: post.errors }, status: 422
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
