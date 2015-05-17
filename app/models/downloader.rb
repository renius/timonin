class Downloader < ActiveRecord::Base
  
  has_many :pictures
  
  def download_images(params)
    params["downloader"]["image"].each do |img|
      self.pictures.create!(image: img, downloader_id: self.id)
    end
  end

end
