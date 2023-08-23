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
    @band.save


    # @band = Band.new(band_params)

    # respond_to do |format|
    #   if @band.save
    #     format.html { redirect_to band_url(@band), notice: "Band was successfully created." }
    #     format.json { render :show, status: :created, location: @band }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @band.errors, status: :unprocessable_entity }
    #   end
    # end


  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :description, :photo_url, :genre)
  end

end
