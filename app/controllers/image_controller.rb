class ImageController < ApplicationController
	include GalleryHelper
  def index
  end

  def new
  	if !current_user
      redirect_to root_path
    end
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update
    image = Image.find(params[:id])
    if current_user && is_admin(current_user)
      image.update_attributes(image_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  	if current_user
      @image = Image.find(params[:id])
    else
      redirect_to root_path
    end
  end


  private

  def image_params
   params.require(:image).permit(:description, :photo)
 end

end
