module Dashboard
  # :nodoc:
  class ParagraphsController < AdminController
    before_action :set_paragraph, only: [:update, :edit, :destroy]

    def index
      @paragraphs = Paragraph.all
    end

    def new
      @paragraph = Paragraph.new
    end

    def create
      @paragraph = Paragraph.new(paragraph_params)

      flash[:error] = if @paragraph.save
                        'Paragraph created successfully! : )'
                      else
                        'Something went terribly wrong....'
                      end

      redirect_to dashboard_paragraphs_path
    end

    def edit
    end

    def update
      flash[:notice] = if @paragraph.update(paragraph_params)
                         'Paragraph updated successfully! : )'
                       else
                         'Something went wrong while trying to update...'
                       end

      redirect_to dashboard_paragraphs_path
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
