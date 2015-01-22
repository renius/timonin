class Admin::PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    @photos = @post.photos.build
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      params[:photos]['image'].each do |photo|
          @post.photos.create!(image: photo, photoable_id: @post.id)
      end
      redirect_to admin_posts_path
    end
  end

  def update
    @post.update(post_params)
    redirect_to admin_post_path
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
