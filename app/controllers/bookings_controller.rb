class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @user = current_user
    @band = Band.find(params[:band_id])
    @booking = Booking.new
    @datepicker_options = 'Array of hashes: Band.datepicker_options'

    @datepicker_options = @band.availabilities.map do |availability|
      {
        from: availability.start_time,
        to: availability.end_time
      }
    end
  end

  def create
    @booking = Booking.new(booking_params)

    @band = Band.find(params[:band_id])
    @user = current_user

    @booking.band = @band
    @booking.user = @user

    if @booking.save
      redirect_to bookings_path, notice: "Booking Created!"
    else
      render :new, status: :unprocessable_entity, notice: "Could not create booking"
    end
  end

  def schedule
    @band = Band.find(params[:band_id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
