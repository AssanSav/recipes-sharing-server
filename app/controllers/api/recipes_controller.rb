class Api::RecipesController < ApplicationController

    def index 
        @recipes = Recipe.all
        if @recipes 
            render json: {
                status: 200,
                recipes: RecipeSerializer.new(@recipes)
            }
        else 
            render json: {
                status: 500,
                errors: "No Record found!"
            }
        end
    end

    def show 
        @recipe = Recipe.find(params[:id])
        if @recipe 
            render json: {
                status: 200,
                recipe: RecipeSerializer.new(@recipe),
                ingredients: @recipe.ingredients
            }
        else 
            render json: {
                status: 500,
                errors: ["No recipes found!"]
            }
        end
    end

    def create 
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            render json: {
                status: :created,
                recipe: RecipeSerializer.new(@recipe)
            }
        else 
            render json: {
                status: 500,
                errors: @recipe.errors.full_messages
            }
        end
    end

    private 
    
    def recipe_params
        params.require(:recipe).permit(:name, :image, :directions, :category_id)
    end
end
