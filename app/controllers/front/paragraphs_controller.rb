class Front::ParagraphsController < ApplicationController
  def index
    @paragraphs = Paragraph.all
  end
end
