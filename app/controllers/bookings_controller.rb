class BookingsController < ApplicationController
    before_action :redirect_if_not_current_user_or_logged_in

    def index
        if current_user && logged_in?
            @bookings = current_user.bookings
            # byebug
        else
            # flash[:error] = "Sorry you have no bookings yet"
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
        
    end

    def edit
        @booking = Booking.find(params[:id])
        @excursion = Excursion.find_by_id(params[:excursion_id])

    end

    def update
        @booking = Booking.find_by(id: params[:id])
        @excursion = Excursion.find_by_id(params[:excursion_id])
        @booking.update(booking_params)
        redirect_to excursion_booking_path(@excursion, @booking)
    end

    def destroy
        @booking = Booking.find(params[:id])
        if @booking.destroy
            redirect_to bookings_path
        else
            flash[:message] = "Was unable to delete booking"
            redirect_to @booking
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:date, :user_id, :excursion_id)
    end

end
