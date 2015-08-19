class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.page(params[:page]).per(3)
    respond_with(@posts)
  end

  def show
    @comments = @post.comments.page(params[:comments_page]).per(6)
    @post_photos = @post.photos
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
end
