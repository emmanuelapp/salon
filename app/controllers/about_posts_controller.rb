class AboutPostsController < ApplicationController
  def index
    @about_posts = AboutPost.all
  end
end
