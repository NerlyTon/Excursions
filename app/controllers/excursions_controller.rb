class ExcursionsController < ApplicationController
    
    def index
        @excursions = Excursion.all
    end

    def new
        @excursion = Excursion.new
    end

    def create
        if current_user && business?
        @excursion = Excursion.new(excursion_params)
            if @excursion.save
                redirect_to excursion_path(@excursion)
            else
                redirect_to new_excursion_path
            end
        else
            redirect_to excursions_path
        
        end
    end

    def show 
        @excursion = Excursion.find(params[:id])
    end

    def edit
        @excursion = Excursion.find(params[:id])
    end

    def update
        @excursion = Excursion.find(params[:id])
        @excursion.update(excursion_params)
        redirect_to excursion_path(@excursion)
    end

    def destroy
        
    end

    private

    def excursion_params
        params.require(:excursion).permit(:company, :location, :price, :included, :what_to_bring, :description, :image_url, :title)
    end
end
