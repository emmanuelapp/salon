module Dashboard
  # :nodoc:
  class ParagraphsController < AdminController
    before_action :find_paragraph, only: [:update, :edit, :destroy]

    def index
      @paragraphs = Paragraph.all
    end

    def new
      @paragraph = Paragraph.new
    end

    def create
      @paragraph = Paragraph.new(paragraph_params)

      if @paragraph.save
        flash[:notice] = t(:created_successfully)
        redirect_to dashboard_paragraphs_path
      else
        flash[:error] = t(:something_went_wrong)
        render :create
      end
    end

    def edit
    end

    def update
      if @paragraph.update(paragraph_params)
        flash[:notice] = t(:updated_successfully)
        redirect_to dashboard_paragraphs_path
      else
        flash[:error] = t(:something_went_wrong)
        render :edit
      end
    end

    def destroy
      @paragraph.delete
      redirect_to dashboard_paragraphs_path
      flash[:notice] = t(:record_deleted)
    end

    private

    def find_paragraph
      @paragraph = Paragraph.find(params[:id])
    end

    def paragraph_params
      params.require(:paragraph).permit(:id, :title, :body)
    end
  end
end
