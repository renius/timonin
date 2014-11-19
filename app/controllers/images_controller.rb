class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]
  respond_to :html

  def index
    @images = Image.all
    respond_with(@images)
  end

  def show
    respond_with(@image)
  end

  def new
    @image = Image.new
    respond_with(@image)
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    redirect_to images_path, notice: 'Photo uploaded' if @image.save
  end

  def update
    respond_to do |format|
      if @image.update(photo_params)
        format.html { redirect_to @image, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy
    respond_with(@image)
  end

  def upload_images
    
  end

  def upload
    @image = Image.new(image: params[:file])
    parsed = Image.parse_filename(params[:name])
    @image.title = parsed[:title]
    if @photo.save
      head 200
    end
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:title, :image)
    end
end
