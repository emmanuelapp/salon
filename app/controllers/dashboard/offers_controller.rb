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

      flash[:notice] = if @offer.save
                         'Offer created successfully! : )'
                       else
                         'Something went terribly wrong....'
                       end

      redirect_to dashboard_offers_path
    end

    def edit
    end

    def update
      flash[:notice] = if @offer.update(offer_params)
                         'Offer updated successfully! : )'
                       else
                         'Something went wrong while trying to update...'
                       end

      redirect_to dashboard_offers_path
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
      params.require(:offer).permit(:description, :name, :price)
    end
  end
end
