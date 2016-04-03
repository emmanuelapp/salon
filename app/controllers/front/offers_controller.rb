class Front::OffersController < ApplicationController
  before_action :set_offer, only: [:show, :destroy, :update, :edit]

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to front_offers_path, notice: "Successfully published!"
    else
      render :new
      flash[:notice] = "Something went wrong..."
    end
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to front_offers_path, notice: "Offer has been updated successfully"
    else
      render :edit
      flash[:notice] = "Something went wrong..."
    end
  end

  def destroy
    @offer.delete
    redirect_to front_offers_path, notice: "Offer has been deleted from the database.."
  end

  def show
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).
      permit(
        :name,
        :description
      )
  end
end
