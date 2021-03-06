class GalleryController < ApplicationController
  include GalleryHelper
  def index
  	#@galleries = Gallery.find(:all, :order => "created_at desc")
    @galleries = Gallery.where("name like ?", "%#{params[:q]}%").order("created_at desc")
    respond_to do |format|
      format.html
      format.json { render :json => @galleries }
    end
  end

  def raise_counter
    gallery = Gallery.find(params[:gallery_id])
    if (!current_user) || (current_user.id != gallery.user_id)
      gallery.viewed += 1
      gallery.save
    end

    redirect_to :back
  end

  def new
    if !current_user
      redirect_to root_path
    end
  end

  def update
    gallery = Gallery.find(params[:id])
    if has_access(gallery, current_user)
      gallery.update_attributes(gallery_params)
      redirect_to gallery_index_path
    else
      redirect_to gallery_index_path
    end
  end

  def edit
    if current_user
      @gallery = Gallery.find(params[:id])
    else
      redirect_to gallery_index_path
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

  def destroy
    @gallery = Gallery.find(params[:id])
    if has_access(@gallery, current_user)
      @gallery.destroy
      redirect_to gallery_index_path
    else
      redirect_to gallery_index_path
    end
  end

  private

  def gallery_params
   params.require(:gallery).permit(:name, :description, :setid, :photo)
 end
end
