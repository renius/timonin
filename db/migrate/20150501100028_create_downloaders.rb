class CreateDownloaders < ActiveRecord::Migration
  def change
    create_table :downloaders do |t|
      t.string :title
      t.timestamps
    end
  end
end
