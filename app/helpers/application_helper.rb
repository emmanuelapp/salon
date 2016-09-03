# :nodoc:
module ApplicationHelper
  def list_items(collection)
    if collection.empty?
      '<h5>This page is empty</h5>'.html_safe
    else
      render collection
    end
  end
end
