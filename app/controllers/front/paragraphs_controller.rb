class Front::ParagraphsController < ApplicationController
  def index
    @about_posts = AboutPost.all
  end
end
