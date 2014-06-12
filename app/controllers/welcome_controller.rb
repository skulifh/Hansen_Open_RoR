class WelcomeController < ApplicationController
  def index
  	@blogs = Blog.find(:all, :order => "created_at desc", :limit => 2)
  	@galleries = Gallery.find(:all, :order => "created_at desc", :limit => 3)
  end
end
