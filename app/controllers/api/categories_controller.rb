class Api::CategoriesController < ApplicationController

    def index 
        @categories = Category.all 
        if @categories
            render json: {
                status: 200,
                categories: @categories
            }
        else 
            render json: {
                status: 500,
                errors: "No Record found!"
            }
        end
    end
end
