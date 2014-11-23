class Image < ActiveRecord::Base
  validates :title, presence: true
  mount_uploader :image, PhotoUploader

  def self.parse_filename(filename)
    filename.gsub!(/(.jpg|.png)/, '')
    return nil unless filename =~ /^\w*-(([a-zA-Z])*(_|$))*/
    filename.split('_').join(' ')
    {title: filename}
  end

end
