class GamesController < ApplicationController
  def index
    @games = Game.order(:created_at).paginate(params[:page])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      redirect_to games_path
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:name, :comment)
  end
end
