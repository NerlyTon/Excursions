class ExcursionsController < ApplicationController
    before_action :redirect_if_not_business
    skip_before_action :redirect_if_not_business, only: [:index, :show]
    
    def index
        if params[:user_id]
            @user = User.find_by_id(params[:user_id])
            @excursions = @user.excursions
        else
            @excursions = Excursion.all
        end
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
        params.require(:excursion).permit(:company, :location, :price, :included, :what_to_bring, :description, :image_url, :title, :pick_up, :drop_off, :veh_num)
    end
end
