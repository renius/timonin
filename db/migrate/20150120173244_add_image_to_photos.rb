class AddImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :image, :string
    add_column :photos, :photoable_id, :integer
    add_column :photos, :photoable_type, :string
  end
end
