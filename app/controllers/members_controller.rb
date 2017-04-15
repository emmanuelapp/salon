class MembersController < ApplicationController
  include Memberable

  def show
    @member = Member.find_by(slug: params[:slug])
  end
end
