Rails.application.routes.draw do

  root             'tags#index'
  post '/tags/create_photo' => "tags#create_photo"
  post '/tags/change_tag_name' => "tags#change_tag_name"
  post '/tags/change_photo_info' => "tags#change_photo_info"
  get '/tags/index' => "tags#index"

end
