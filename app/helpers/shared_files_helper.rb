module SharedFilesHelper

  def options_for_categories(categories)
    if categories
      options_for_select(categories.map{|c| [c.category, c.category]})
    end
  end
end
