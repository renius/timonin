class Picture < ActiveRecord::Base
  belongs_to :downloader
  mount_uploader :image, ImageUploader 
end
