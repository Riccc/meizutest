class TagsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:change_tag_name,:change_photo_info]
  def index
    @datas = Tag.all
    @photos = Photo.where(:tag_id => params[:id]).page(params[:page]).per(6)
    @photo = Photo.new
    if params[:id].present?
      @tag_name = Tag.find_by_id(params[:id]).name
    else
      @tag_name = ""
    end
  end

  def create_photo
    @photo = Photo.create(photo_params)
    @tag_name = Tag.find_by_id(@photo.tag_id).name
        redirect_to({:action=>"index"})
  end

  def change_tag_name
    tag = Tag.find_by_name(params[:old_tag_name])
    tag.update_attribute(:name,params[:new_tag_name])
  end

  def change_photo_info
    photo = Photo.find_by_id(params[:photo_info])
    tag = Tag.find_by_name(params[:tag_info])
    photo.update_attribute(:tag_id,tag.id)
  end

  private
  def photo_params
    params.require(:photo).permit(:tag_id,:title,:avatar)
  end
end
