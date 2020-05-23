class Api::RecipeIngredientsController < ApplicationController

    def create 
        @recipe = current_user.recipes.find(params[:recipe_id])
        if @recipe
            rec_ingredient = RecipeIngredient.create!(ingredient_params)
            if rec_ingredient
                render json: {
                    status: 200,
                    ingredient: {id: rec_ingredient.ingredient.id, name: rec_ingredient.ingredient.name, amount: rec_ingredient.amount}
                }
            else 
                render json: {
                    status: 500,
                    errors: rec_ingredient.errors.full_messages
                }
            end
        end
    end

    private 

    def ingredient_params
        params.require(:ingredient).permit(:ingredient_name, :amount, :recipe_id)
    end
end
