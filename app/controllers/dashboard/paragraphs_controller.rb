module Dashboard
  # :nodoc:
  class ParagraphsController < AdminController
    include Paragraphable
    before_action :find_paragraph, only: %i[update edit destroy]

    def new
      @paragraph = Paragraph.new
    end

    def create
      @paragraph = Paragraph.new(paragraph_params)

      if @paragraph.save
        redirect_to dashboard_paragraphs_path, notice: t(:created_successfully)
      else
        flash[:error] = t(:something_went_wrong)
        render :create
      end
    end

    def edit; end

    def update
      if @paragraph.update(paragraph_params)
        redirect_to dashboard_paragraphs_path, notice: t(:updated_successfully)
      else
        flash[:error] = t(:something_went_wrong)
        render :edit
      end
    end

    def destroy
      @paragraph.destroy!
      redirect_to dashboard_paragraphs_path, notice: t(:record_deleted)
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
