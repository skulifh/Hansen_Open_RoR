class AddPhotoFileNameAndPhotoFileSizeAndPhotoContentTypeAndPhotoUpdatedAtToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :photo_file_name, :string
    add_column :galleries, :photo_file_size, :integer
    add_column :galleries, :photo_content_type, :string
    add_column :galleries, :photo_updated_at, :datetime
  end
end
