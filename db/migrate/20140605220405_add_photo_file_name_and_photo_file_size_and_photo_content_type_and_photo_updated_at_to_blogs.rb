class AddPhotoFileNameAndPhotoFileSizeAndPhotoContentTypeAndPhotoUpdatedAtToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :photo_file_name, :string
    add_column :blogs, :photo_file_size, :integer
    add_column :blogs, :photo_content_type, :string
    add_column :blogs, :photo_updated_at, :datetime
  end
end
