class BookingsController < ApplicationController

    def index
        if params[:excursion_id]
            @excursion = excursion.find_by_id(params[:excursion_id])
            @bookings = @excursion.bookings
        else
            redirect_to excursions_path
        end
    end

    def new
        if params[:excursion_id]
            
            @excursion = Excursion.find_by_id(params[:excursion_id])
            #  byebug
            @booking = @excursion.bookings.build
            

        else
            @booking = Booking.new
        end
    end

    def create
        # byebug
        if params[:excursion_id]
            @excursion = Excursion.find_by_id(params[:excursion_id])
            @booking = @excursion.bookings.build(booking_params)
            # byebug
        else   
            @booking = Booking.new(booking_params)
            # byebug
        end 

        if @booking.save
            
                redirect_to excursion_booking_path(@excursion, @booking)
        else
           redirect_to excursion_path(@excursion)
        end
    end
        


    def show
        # if params[:excursion_id]
        @excursion = Excursion.find_by_id(params[:excursion_id])
        @booking = Booking.find(params[:id])
        @excursion.bookings
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
        params.require(:booking).permit(:date, :user_id, :excursion_id)
    end

end
