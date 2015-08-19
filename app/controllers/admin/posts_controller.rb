class Admin::PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :find_post_photos, only: [:edit, :show]

  def index
    @posts = Post.page(params[:page]).per(3)
  end

  def show
    @comments = @post.comments.page(params[:comments_page]).per(6)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.save
    respond_with(:admin, @post)
  end

  def update
    @post.update(post_params)
    respond_with(:admin, @post)
  end

  def destroy
    @post.destroy
    respond_with(:admin, @post)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def find_post_photos
    @post_photos = @post.photos
  end

  def post_params
    attributes = [
      :title, :body,
      photos_attributes: [:post_id, :photo, :_destroy, :id]
    ]
    params.require(:post).permit(attributes)
  end
end
