class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @flat = Flat.find(params[:flat_id])
    @reservation = @flat.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to @flat, notice: "Reservation was successfully created."
    else
      render 'flats/show'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
