module Memberable
  def index
    @members = Member.all
  end
end
