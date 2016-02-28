class AboutPostsController < ApplicationController
  def index
    @about_posts = AboutPost.all
  end

  def new
    @about_post = AboutPost.new
  end

  def create
    render text: "TODO"
  end
end
