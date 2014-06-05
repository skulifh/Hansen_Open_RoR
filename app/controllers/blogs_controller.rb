class BlogsController < ApplicationController

	def index
		@blogs = Blog.all()
	end

	def create
		@blog = Blog.new(blog_params)
		if @blog.save
      		redirect_to root_path
    	else
      		redirect_to root_path
    	end
	end

	private

	def blog_params
  	  params.require(:blog).permit(:title, :text)
    end
end
