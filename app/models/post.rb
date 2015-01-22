class Post < ActiveRecord::Base
  has_many :comments
  validates :title, :body, presence: true
  has_many :photos, as: :photoable
  accepts_nested_attributes_for :photos
end
