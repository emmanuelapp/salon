module Front
  class MembersController < ApplicationController
    def index
      @members = Member.all
    end
  end
end
