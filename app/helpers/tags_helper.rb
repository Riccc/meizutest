module TagsHelper
  def get_all_tags
    data = Tag.all.to_a.collect{|a|[a[:name],a[:id]]}
    return data
  end
end
