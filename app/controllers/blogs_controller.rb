class BlogsController < ApplicationController

	def index
		@blogs = Blog.find(:all, :order => "created_at desc")
	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.save
      		redirect_to root_path
    	else
      		redirect_to root_path
    	end
	end

	def show
		@blog = Blog.find(params[:id])
	end

	private

	def blog_params
  	  params.require(:blog).permit(:title, :text, :photo)
    end
end
