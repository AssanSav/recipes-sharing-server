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

    def show 
          @user = User.find(params[:id])
        if @user
            render json: {
                user: UserSerializer.new(@user).as_json
            }
        else 
            render json: {
                status: 500, 
                errors: ["user not found"]
            }
        end
    end

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end