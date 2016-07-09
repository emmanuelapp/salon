module Dashboard
  class ParagraphsController < ApplicationController
    layout 'dashboard'
    before_action :set_paragraph, only: [:update, :edit, :destroy]

    def index
      @paragraphs = Paragraph.all
    end

    def new
      @paragraph = Paragraph.new
    end

    def create
      @paragraph = Paragraph.new(paragraph_params)

      if @paragraph.save
        redirect_to dashboard_paragraphs_path
        flash[:notice] = 'Paragraph created successfully! : )'
      else
        redirect_to dashboard_paragraphs_path
        flash[:error] = 'Something went terribly wrong....'
      end
    end

    def edit
    end

    def update
      if @paragraph.update(paragraph_params)
        redirect_to dashboard_paragraphs_path
        flash[:notice] = 'Paragraph updated successfully! : )'
      else
        redirect_to dashboard_paragraphs_path
        flash[:notice] = 'Something went wrong while trying to update...'
      end
    end

    def destroy
      @paragraph.delete
      redirect_to dashboard_paragraphs_path
      flash[:notice] = 'Post has been successfully deleted from the database'
    end

    private

    def set_paragraph
      @paragraph = Paragraph.find(params[:id])
    end

    def paragraph_params
      params.require(:paragraph).permit(:id, :title, :body)
    end
  end
end
