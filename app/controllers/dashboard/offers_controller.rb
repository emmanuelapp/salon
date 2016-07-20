module Dashboard
  # :nodoc:
  class OffersController < AdminController
    before_action :set_offer, only: [:update, :edit, :destroy]

    def index
      @offers = Offer.all
    end

    def new
      @offer = Offer.new
    end

    def create
      @offer = Offer.new(offer_params)

      if @offer.save
        redirect_to dashboard_offers_path
        flash[:notice] = 'Offer created successfully! : )'
      else
        redirect_to dashboard_offers_path, 'Something went terribly wrong....'
      end
    end

    def edit
    end

    def update
      if @offer.update(offer_params)
        redirect_to dashboard_offers_path
        flash[:notice] = 'Offer updated successfully! : )'
      else
        redirect_to dashboard_offers_path
        flash[:notice] = 'Something went wrong while trying to update...'
      end
    end

    def destroy
      @offer.delete
      redirect_to dashboard_offers_path
      flash[:notice] = 'Offer has been successfully deleted from the database'
    end

    private

    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:description, :name)
    end
  end
end
