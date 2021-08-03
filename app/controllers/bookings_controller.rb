class BookingsController < ApplicationController
  def create
    @figurine = Figurine.find(params[:figurine_id])
    @booking = Booking.new(booking_params)
    @booking.figurine = @figurine

    if @booking.save
      redirect_to @figurine
    else
      # render @figurine
      redirect_to @figurine
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:game_id, :player)
  end
end
