class Api::RecipesController < ApplicationController

    def index 
        @recipes = Recipe.all
        if @recipes 
            render json: {
                status: 200,
                recipes: @recipes
            }
        else 
            render json: {
                status: 500,
                errors: "No Record found!"
            }
        end
    end
end
