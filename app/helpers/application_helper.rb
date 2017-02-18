# :nodoc:
module ApplicationHelper
  def no_content_message(collection)
    "<h4>#{t(:no_content)}</h4>".html_safe if collection.empty?
  end
end
