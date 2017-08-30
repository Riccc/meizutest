class AddTagsData < ActiveRecord::Migration
  def change
    tags = ["unTag","Family","Animals","Children"]
    tags.each do |a|
      Tag.create(:name=>a)
    end
  end
end
