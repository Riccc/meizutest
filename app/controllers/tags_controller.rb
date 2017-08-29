class TagsController < ApplicationController
  def index
    @datas = Tag.all
    @photo = Photo.new
  end

  def create_photo
    @photo = Photo.create(photo_params)
    @tag_name = Tag.find_by_id(@photo.tag_id).name
    respond_to do |format|
      format.js
    end
  end

  def get_photos
    tag_data = Tag.find_by_name(params[:tag_name])
    photos_data = Photo.where(:tag_id=>tag_data.id).page(params[:page]).per(3)
    binding.pry
    photo_url = []
    photos_data.each do |d|
      photo_url.push(d.avatar.url)
    end
    info = {:tag_info=>photos_data,:tag=>tag_data.name,:tag_url=>photo_url}
    render :json=>info
  end

  private
  def photo_params
    params.require(:photo).permit(:tag_id,:title,:avatar)
  end
end
