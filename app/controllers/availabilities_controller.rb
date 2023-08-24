class AvailabilitiesController < ApplicationController
  # before_action :set_availability

  def index
    @band = Band.find(params[:band_id])
    @availabilities = Availability.where(band: @band)
  end

  def show

  end

  def new
    @band = Band.find(params[:band_id])
    @availability = Availability.new
  end

  def create
    @band = Band.find(params[:band_id])
    @availability = Availability.new(availability_params)

    @availability.band = @band
    if @availability.save
      redirect_to band_availabilities_path, notice: "Avaliability created!"
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def set_availability
   @availability = Availability.find(params[:id])
  end

  def availability_params
    params.require(:availability).permit(:start_time, :end_time)
  end


end
