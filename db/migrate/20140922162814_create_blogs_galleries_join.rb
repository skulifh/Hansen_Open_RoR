class CreateBlogsGalleriesJoin < ActiveRecord::Migration
  def change
    create_table :blogs_galleries do |t|
    	t.integer :blog_id
    	t.integer :gallery_id
    end
  end
end
