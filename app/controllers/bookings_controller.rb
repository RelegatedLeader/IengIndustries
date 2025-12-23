class BookingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bookings = current_user.bookings.order(created_at: :desc)
  end
  
  def new
    @booking = Booking.new
    @vehicles = Vehicle.where(status: :available)
    @locations = Location.all
  end
  
  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking created successfully!'
    else
      render :new
    end
  end
  
  def show
    @booking = Booking.find(params[:id])
    authorize_booking!
  end
  
  def cancel
    @booking = Booking.find(params[:id])
    authorize_booking!
    @booking.update(status: :cancelled)
    redirect_to @booking, notice: 'Booking cancelled.'
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(:vehicle_id, :pickup_location_id, :dropoff_location_id, :scheduled_time, :passenger_count, :special_requests)
  end
  
  def authorize_booking!
    redirect_to root_path unless current_user == @booking.user || current_user.admin?
  end
end
