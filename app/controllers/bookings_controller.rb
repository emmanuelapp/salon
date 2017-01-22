class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = t(:created_successfully)
      redirect_to new_front_booking_path
    else
      flash[:error] = t(:something_went_wrong)
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(
      :id,
      :first_name,
      :last_name,
      :phone,
      :approved,
      :additional_info,
      :created_at,
      :updated_at,
      :reservation
    )
  end
end
