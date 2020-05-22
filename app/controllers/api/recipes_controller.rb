class Api::RecipesController < ApplicationController

    def index 
        @recipes = Recipe.all
        if @recipes 
            options = {
                include: [:category, :user]
            }
            render json: {
                status: 200,
                recipes: RecipeSerializer.new(@recipes, options)
            }
        else 
            render json: {
                status: 500,
                errors: "No Record found!"
            }
        end
    end
end
