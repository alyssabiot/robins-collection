class FigurinesController < ApplicationController
  def index
    @figurines = Figurine.all
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
     params.require(:figurine).permit(:name, :comment)
   end
end
