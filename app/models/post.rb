class Post < ActiveRecord::Base
  validates :title, :body, presence: true
  mount_uploader :photo, PhotoUploader
end
