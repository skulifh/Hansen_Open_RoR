class AddViewedToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :viewed, :integer, default: 0 
  end
end
