class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to new_booking_path, notice: t(:created_successfully)
    else
      flash[:notice] = t(:something_went_wrong)
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
