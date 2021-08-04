class SpecialitiesController < ApplicationController
  http_basic_authenticate_with name: ENV['APP_USERNAME'], password: ENV['APP_PASSWORD'], except: [:index] if Rails.env.production?

  def index
    @specialities = Speciality.order(:name).paginate(params[:page])
  end

  def new
    @speciality = Speciality.new
  end

  def create
    @speciality = Speciality.new(speciality_params)

    if @speciality.save
      redirect_to specialities_path
    else
      render :new
    end
  end

  def edit
    @speciality = Speciality.find(params[:id])
  end

  def update
    @speciality = Speciality.find(params[:id])

    if @speciality.update(speciality_params)
      redirect_to specialities_path
    else
      render :edit
    end
  end

  def destroy
    @speciality = Speciality.find(params[:id])
    @speciality.destroy

    redirect_to specialities_path
  end

  private
  def speciality_params
    params.require(:speciality).permit(:name)
  end
end
