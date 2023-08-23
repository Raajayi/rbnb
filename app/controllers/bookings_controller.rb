class BookingsController < ApplicationController
  def index
    # @bookings = Booking.all
    if current_user
      @bookings = Booking.where(user: current_user)
    else
      @bookings = Booking.all
      # @bookings = Booking.where(user == User.first)
      # notice = 'test run'
    end
  end
end
