class AddDownloaderToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :downloader_id, :integer
  end
end
