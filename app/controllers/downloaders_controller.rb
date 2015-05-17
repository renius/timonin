class DownloadersController < ApplicationController
  
  def new
    @downloader = Downloader.new  
  end

  def create
    @downloader = Downloader.new(downloader_params)
    if @downloader.save
      @downloader.download_images(params)
      redirect_to new_downloader_path
    end
  end

  private

  def downloader_params
    params.require(:downloader).permit(:title, :image)
  end

end
