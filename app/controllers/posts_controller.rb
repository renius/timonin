class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  respond_to :html

  def index
    @posts = Post.page(params[:page]).per(3)
    respond_with(@posts)
  end

  def show
    @comments = @post.comments.page(params[:comments_page]).per(3)
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :photo)
    end
end
