class FigurinesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @figurines = Figurine.includes(:universe).order(sort_column + " " + sort_direction).paginate(params[:page])
    @total = Figurine.all.count
  end

  def show
    @figurine = Figurine.find(params[:id])
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
    sortable_fields = ["name", "universes.name"]
    sortable_fields.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
