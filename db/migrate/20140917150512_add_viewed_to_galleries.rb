class AddViewedToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :viewed, :integer, default: 0 
  end
end
