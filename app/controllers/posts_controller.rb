class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    @images = @post.images.all
    respond_with(@post)
  end

  def new
    @post = Post.new
    @image = @post.images.build
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        params[:images]['photo'].each do |a|
          @image = @post.images.create!(:image => a, :post_id => @post.id)
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
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
      params.require(:post).permit(:title, :body, images_attributes: [:id, :post_id, :image])
    end
end
