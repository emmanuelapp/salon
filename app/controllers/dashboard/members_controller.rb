module Dashboard
  # :nodoc:
  class MembersController < AdminController
    include Memberable
    before_action :find_member, only: [:update, :edit, :destroy]

    def new
      @member = Member.new
    end

    def create
      @member = Member.new(member_params)

      if @member.save
        redirect_to dashboard_members_path, notice: t(:created_successfully)
      else
        render :new
        flash[:error] = t(:something_went_wrong)
      end
    end

    def edit; end

    def update
      if @member.update(member_params)
        redirect_to dashboard_members_path, notice: t(:updated_successfully)
      else
        render :edit
        flash[:error] = t(:something_went_wrong)
      end
    end

    def destroy
      @member.destroy!
      redirect_to dashboard_members_path, notice: t(:record_deleted)
    end

    private

    def find_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(
        :first_name,
        :last_name,
        :profession,
        :description,
        :phone_number,
        :avatar
      )
    end
  end
end
