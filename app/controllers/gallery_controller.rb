class GalleryController < ApplicationController
  def index
  	@galleries = Gallery.all()
  end

  def create
		@gallery = Gallery.new(gallery_params)
		if @gallery.save
      		redirect_to root_path
    	else
      		redirect_to root_path
    	end
	end

  private

	def gallery_params
  	  params.require(:gallery).permit(:name, :setid)
    end
end
