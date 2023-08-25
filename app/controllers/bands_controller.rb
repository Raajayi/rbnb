class BandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_band, only: :show

  def index
    @bands = Band.all
    if current_user.nil?
      @user_first_name = "Friend"
    else
      @user_first_name = current_user.first_name.nil? ? "Friend" : current_user.first_name
    end
  end

  def show

  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
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
    params.require(:band).permit(:name, :description, :photo_url, :genre, :photo)
  end
end
