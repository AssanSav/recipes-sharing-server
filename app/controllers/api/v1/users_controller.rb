class UsersController < ApplicationController 

    def create 
        @user = User.create!(user_params)
        if @user
            sesion[:user_id] = @user.id
            render json: {
                status: created,
                user: @user
            }
        else 
            render json: {
                status: 500,
                errors: @user.errors.full_messages
            }
        end
    end
end