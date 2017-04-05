require_dependency './app/forms/booking_form'

class BookingsController < ApplicationController
  def index
    redirect_to new_booking_path
  end

  def new
    @booking = BookingForm.new
  end

  def create
    @booking = BookingForm.new(params)

    if @booking.save
      redirect_to new_booking_path, notice: t(:created_successfully)
    else
      flash[:notice] = t(:something_went_wrong)
      render :new
    end
  end
end
