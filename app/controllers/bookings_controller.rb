class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @user = current_user
    @band = Band.find(params[:band_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    @band = Band.find(params[:band_id])
    @user = current_user

    @booking.band = @band
    @booking.user = @user

    if @booking.save
      # TODO: Redirect to MY BOOKINGS PAGE
      redirect_to band_path(@band), notice: "Booking Created!"
    else
      render :new, status: :unprocessable_entity, notice: "Could not create booking"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
