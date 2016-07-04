class Front::MembersController < ApplicationController
  def index
    @members = Member.all
  end
end
