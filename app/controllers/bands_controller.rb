class BandsController < ApplicationController
  before_action :set_band, only: :show

  def index
    @bands = Band.all
  end
  def show
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    # TODO Replace User.first with current_user when available
    @band.user = current_user
    if @band.save
      redirect_to bands_path, notice: "Band created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :description, :photo_url, :genre)
  end
end
