class BookingsController < ApplicationController
    before_action :redirect_if_not_current_user_or_logged_in, :find_excursion, :find_booking
    skip_before_action :find_excursion, only: [:index, :destroy]
    skip_before_action :find_booking, only: [:index, :new, :create]



    def index
        @bookings = current_user.bookings
    end

    def new
        @booking = @excursion.bookings.build
    end

    def create
        @booking = @excursion.bookings.build(booking_params)
        
        if @booking.save
            redirect_to excursion_booking_path(@excursion, @booking)
        else
           redirect_to excursion_path(@excursion)
        end
    end
        
    def show
       
    end

    def edit
       
    end

    def update
        @booking.update(booking_params)
        redirect_to excursion_booking_path(@excursion, @booking)
    end

    def destroy
        if @booking.destroy
            redirect_to bookings_path
        else
            flash[:message] = "Was unable to delete booking"
            redirect_to @booking
        end
    end

    private

    def find_excursion
        @excursion = Excursion.find_by_id(params[:excursion_id])
    end

    def find_booking
        @booking = Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:date, :num_of_people, :user_id, :excursion_id)
    end

end
