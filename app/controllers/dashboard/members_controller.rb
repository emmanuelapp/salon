module Dashboard
  # :nodoc:
  class MembersController < AdminController
    before_action :set_member, only: [:update, :edit, :destroy]

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
        flash[:notice] = 'Member created successfully! : )'
      else
        render :new
        flash[:error] = 'Something went terribly wrong....'
      end
    end

    def edit
    end

    def update
      if @member.update(member_params)
        redirect_to dashboard_members_path
        flash[:notice] = 'Member updated successfully! : )'
      else
        redirect_to dashboard_members_path
        flash[:notice] = 'Something went wrong while trying to update...'
      end
    end

    def destroy
      @member.delete
      redirect_to dashboard_members_path
      flash[:notice] = 'Member has been successfully deleted from the database'
    end

    private

    def set_member
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
