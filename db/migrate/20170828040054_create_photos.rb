class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string "tag_id",:limit=>20,:null=>false
      t.string "title",:limit=>100
      t.timestamps null: false
    end
  end
end
