class Image < ActiveRecord::Base
  mount_uploader :image, PhotoUploader
  belongs_to :post
end
