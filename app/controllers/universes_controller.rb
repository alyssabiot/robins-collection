class UniversesController < ApplicationController
  http_basic_authenticate_with name: ENV['APP_USERNAME'], password: ENV['APP_PASSWORD'], except: [:index] if Rails.env.production?

  def index
    @universes = Universe.order(:name).paginate(params[:page])
  end

  def new
    @universe = Universe.new
  end

  def create
    @universe = Universe.new(universe_params)

    if @universe.save
      redirect_to universes_path
    else
      render :new
    end
  end

  def edit
    @universe = Universe.find(params[:id])
  end

  def update
    @universe = Universe.find(params[:id])

    if @universe.update(universe_params)
      redirect_to universes_path
    else
      render :edit
    end
  end

  def destroy
    @universe = Universe.find(params[:id])
    @universe.destroy

    redirect_to universes_path
  end

  private
   def universe_params
     params.require(:universe).permit(:name)
   end
end
