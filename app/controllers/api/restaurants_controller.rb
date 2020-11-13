class Api::V1::RestaurantsController < ApplicationController

    def index
        restaurants = Restaurant.all

        render json: RestaurantSerializer.new(restaurants).serialized_json
    end

    def show
        restaurant = Restaurant.find(params[:id])

        render json: RestaurantSerializer.new(restaurant).serialized_json
    end
    
    def create
        restaurant = Restaurant.new(restaurant_params)

        if @restaurant.save
            render json: RestaurantSerializer.new(restaurant).serialized_json
        else
            render json: { error: airline.errors.messages }, status: 422
        end
    end

    private

    def restaurant_params
        params.require(:restaurant).permit(:name, :location, :cuisine, :search)
    end
end