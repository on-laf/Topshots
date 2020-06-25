class BookingsController < ApplicationController

  def new
    @photographer = Photographer.find(params[:photographer_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @photographer = Photographer.find(params[:photographer_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.photographer = @photographer
    @booking.total_price = @photographer.price * @booking.duration
    authorize @booking
    if @booking.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def show
    @photographer = Photographer.find(params[:photographer_id])
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:day, :duration, :total_price, :confirmed, :completed, :user_id, :photographer_id)
  end
end
