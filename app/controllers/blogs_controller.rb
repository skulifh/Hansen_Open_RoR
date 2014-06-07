class BlogsController < ApplicationController
	include BlogsHelper
	def index
		@blogs = Blog.find(:all, :order => "created_at desc")
	end

	def new
		if !current_user
			redirect_to root_path
		end
	end

	def update
		if current_user
			blog = Blog.find(params[:id])
			blog.update_attributes(blog_params)
			redirect_to blogs_path
		else
			redirect_to blogs_path
		end
	end

	def edit
		if current_user
			@blog = Blog.find(params[:id])
		else
			redirect_to blogs_path
		end
	end

	def destroy
		if current_user
			@blog = Blog.find(params[:id])
			@blog.destroy
			redirect_to blogs_path
		else
			redirect_to blogs_path
		end
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.user_id = current_user.id
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
