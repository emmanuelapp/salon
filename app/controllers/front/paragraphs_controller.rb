class Front::ParagraphsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    @about_posts = AboutPost.all
  end

  def new
    @about_post = AboutPost.new
  end

  def create
    @about_post = AboutPost.new(paragraph_params)

    if @about_post.save
      flash[:notice] = "Публикацията е успешно запаметена!"
    else
      flash[:notice] = "Възникна грешка!!"
    end

    redirect_to root_path
  end

  def edit
  end

  def update
  	if @about_post.update(paragraph_params)
  	  flash[:notice] = "Успешна редакция на публикацията"
  	else
  	  flash[:notice] = "Възникна грешка!!"
  	end
    redirect_to root_path
  end

  def destroy
    @about_post.delete
    redirect_to root_path, notice: "Post has been deleted"
  end

  private

  def find_post
  	@about_post = AboutPost.find(params[:id])
  end

  def paragraph_params
  	params.require(:about_post).permit(:title, :body)
  end
end