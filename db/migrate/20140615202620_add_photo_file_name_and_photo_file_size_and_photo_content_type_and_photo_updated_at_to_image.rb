class AddPhotoFileNameAndPhotoFileSizeAndPhotoContentTypeAndPhotoUpdatedAtToImage < ActiveRecord::Migration
  def change
    add_column :images, :photo_file_name, :string
    add_column :images, :photo_file_size, :integer
    add_column :images, :photo_content_type, :string
    add_column :images, :photo_updated_at, :datetime
  end
end
