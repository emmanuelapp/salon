# :nodoc:
module ApplicationHelper
  def no_content_message(collection)
    return unless collection.empty?

    content_tag(:h4, t(:no_content))
  end
end
