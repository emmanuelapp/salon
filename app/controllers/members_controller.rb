class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if(@member.save)
      redirect_to members_path, notice: "Yay! You have added a new member to the team successfully! : )"
    else
      render :new
      flash[:notice] =  "Ouch... something went terribly wrong! : ("
    end
  end

  def show
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to members_path, notice: "Great! You have updated #{@member.full_name}\'s profile successfully!"
    else
      render :edit, notice: "Ouch... something went terribly wrong! : ("
    end
  end

  def destroy
    @member.delete
    redirect_to members_path, notice: "#{@member.full_name} has been removed from the database!"
  end

  private

  def not_found
    render text: "<h1>The requested member has been deleted or does not exist..</h1>"
  end

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).
      permit(
        :first_name,
        :last_name,
        :description,
        :profession,
        :avatar
      )
  end
end
