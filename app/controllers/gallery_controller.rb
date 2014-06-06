class GalleryController < ApplicationController
  include GalleryHelper
  def index
  	@galleries = Gallery.all()
  end

  def new
    if !current_user
      redirect_to root_path
    end
  end

  def create
		@gallery = Gallery.new(gallery_params)
    @gallery.user_id = current_user.id
		if @gallery.save
      		redirect_to root_path
    	else
      		redirect_to root_path
    	end
	end

  private

	def gallery_params
  	  params.require(:gallery).permit(:name, :description, :setid, :photo)
    end
end
