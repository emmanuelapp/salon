class Dashboard::MembersController < ApplicationController
  before_action :set_member, only: [:update, :edit]

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to dashboard_members_path
      flash[:notice] = "Member created successfully! : )"
    else
      redirect_to dashboard_members_path, "Something went terribly wrong...."
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to dashboard_members_path
      flash[:notice] = "Member updated successfully! : )"
    else
      redirect_to dashboard_members_path
      flash[:notice] = "Something went wrong while trying to update..."
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:first_name, :last_name, :profession, :description)
  end
end
