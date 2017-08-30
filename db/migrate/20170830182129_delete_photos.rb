class DeletePhotos < ActiveRecord::Migration
  def change
    Photo.all.each do |a|
      a.destroy
    end
  end
end
