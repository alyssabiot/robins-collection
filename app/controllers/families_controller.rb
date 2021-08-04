class FamiliesController < ApplicationController
  http_basic_authenticate_with name: ENV['APP_USERNAME'], password: ENV['APP_PASSWORD'], except: [:index] if Rails.env.production?

  def index
    @families = Family.order(:name).paginate(params[:page])
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)

    if @family.save
      redirect_to families_path
    else
      render :new
    end
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
    @family = Family.find(params[:id])

    if @family.update(family_params)
      redirect_to families_path
    else
      render :edit
    end
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy

    redirect_to families_path
  end

  private
  def family_params
    params.require(:family).permit(:name)
  end
end
