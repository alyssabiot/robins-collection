class FigurinesController < ApplicationController
  http_basic_authenticate_with name: ENV['APP_USERNAME'], password: ENV['APP_PASSWORD'], except: [:index, :show] if Rails.env.production?
  helper_method :sort_column, :sort_direction

  SORTABLE_FIELDS = ["name", "universes.name", "families.name", "is_painted", "has_artist", "has_portrait"]

  def index
    @figurines = Figurine.includes(:universe, :family).order("#{sort_column} #{sort_direction}", name: :asc).paginate(params[:page])
    @total = Figurine.all.count
  end

  def show
    @figurine = Figurine.find(params[:id])
    @booking = Booking.new
    @bookings = @figurine.bookings
  end

  def new
    @figurine = Figurine.new
  end

  def create
    @figurine = Figurine.new(figurine_params)

    if @figurine.save
      redirect_to @figurine
    else
      render :new
    end
  end

  def edit
    @figurine = Figurine.find(params[:id])
  end

  def update
    @figurine = Figurine.find(params[:id])

    if @figurine.update(figurine_params)
      redirect_to @figurine
    else
      render :edit
    end
  end

  def destroy
    @figurine = Figurine.find(params[:id])
    @figurine.destroy

    redirect_to root_path
  end

  private
  def figurine_params
    params.require(:figurine).permit(:name, :comment, :reference_picture,
                                      :painted_picture, :portrait, :universe_id,
                                      :artist_id, :family_id)
  end

  def sort_column
    SORTABLE_FIELDS.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
