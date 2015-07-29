module ApplicationHelper

  # Helper method to create pretty page titles
  def print_full_title(page_title = '')
    base_title = "Meet Figaro"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
end
