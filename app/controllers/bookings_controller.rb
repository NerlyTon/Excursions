class BookingsController < ApplicationController

    def index
        @bookings = Booking.all
    end

    def new
        @booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            redirect_to booking_path(@booking)
        else
            redirect_to new_booking_path
        end
    end

    def show 
        @booking = Booking.find(params[:id])
    end

    def edit
        @booking = Booking.find(params[:id])
    end

    def update
        @booking = Booking.find_by(id: params[:id])
        @booking.update(booking_params)
        redirect_to booking_path(@booking)
    end

    def destroy
        
    end

    private

    def booking_params
        params.require(:booking).permit(:date, :pick_up, :drop_off:, :info, :user_id, :excursion_id)
    end

end
