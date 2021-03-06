class ExcursionsController < ApplicationController
    before_action :redirect_if_not_business, :redirect_if_not_logged_in, :find_excursion
    skip_before_action :redirect_if_not_business, only: [:index, :show, :all_inclusive]
    skip_before_action :redirect_if_not_logged_in, only: [:index, :show, :all_inclusive]
    skip_before_action :find_excursion, only: [:index, :new, :create, :all_inclusive, :search]
    
    
    def index
        @excursions = Excursion.all
    end

    def new
        @excursion = Excursion.new
    end

    def create
        @excursion = Excursion.new(excursion_params)
        if @excursion.save
            redirect_to excursion_path(@excursion)
        else
            redirect_to new_excursion_path
        end
    end

    def show 
        
    end

    def all_inclusive
        @excursions = Excursion.all_inclusive 
        render :index
    end

    def search
        @excursions = Excursion.search(params[:search])
        # byebug
        render :index
    end

    def edit
        
    end

    def update
        @excursion.update(excursion_params)
        redirect_to excursion_path(@excursion)
    end

    def destroy
        if @excursion.destroy
            redirect_to root_path
        else
            flash[:message] = "Was unable to delete excursion"
            redirect_to @excursion
        end
    end

    private

    def find_excursion
        @excursion = Excursion.find(params[:id])
    end

    def excursion_params
        params.require(:excursion).permit(:company, :location, :price, :included, :what_to_bring, :description, :image_url, :title, :drop_off, :veh_info, :pick_up, :all_inclusive)
    end
end
