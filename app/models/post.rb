class Post < ActiveRecord::Base
  has_many :comments
  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title, :body, presence: true
end
