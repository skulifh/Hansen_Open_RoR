class AddPhotoFileNameAndPhotoFileSizeAndPhotoContentTypeAndPhotoUpdatedAtToTournaments < ActiveRecord::Migration
  def change
    add_column :tournaments, :photo_file_name, :string
    add_column :tournaments, :photo_file_size, :integer
    add_column :tournaments, :photo_content_type, :string
    add_column :tournaments, :photo_updated_at, :datetime
  end
end
