class ArtistsController < ApplicationController
  http_basic_authenticate_with name: ENV['APP_USERNAME'], password: ENV['APP_PASSWORD'], except: [:index] if Rails.env.production?

  def index
    @artists = Artist.order(:name).paginate(params[:page])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update(artist_params)
      redirect_to artists_path
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path
  end

  private
  def artist_params
    params.require(:artist).permit(:name)
  end
end
