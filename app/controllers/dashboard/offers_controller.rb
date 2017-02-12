module Dashboard
  # :nodoc:
  class OffersController < AdminController
    include Offerable

    before_action :find_offer, only: [:update, :edit, :destroy]

    def new
      @offer = Offer.new
    end

    def create
      @offer = Offer.new(offer_params)

      if @offer.save
        redirect_to dashboard_offers_path, notice: t(:created_successfully)
      else
        flash[:error] = t(:something_went_wrong)
        render(:new)
      end
    end

    def edit; end

    def update
      if @offer.update(offer_params)
        redirect_to dashboard_offers_path, notice: t(:updated_successfully)
      else
        flash[:error] = t(:something_went_wrong)
        render(:edit)
      end
    end

    def destroy
      @offer.destroy!
      redirect_to dashboard_offers_path, notice: t(:record_deleted)
    end

    private

    def find_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:description, :name, :price)
    end
  end
end
