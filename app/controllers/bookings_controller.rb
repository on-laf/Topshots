class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    # authorize @booking
    if @boooking.save
      redirect_to profile_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:day, :duration, :total_price, :confirmed, :completed, :user_id, :photographer_id)
  end
end
