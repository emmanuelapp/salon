module Front
  class ParagraphsController < ApplicationController
    def index
      @paragraphs = Paragraph.all
    end
  end
end
