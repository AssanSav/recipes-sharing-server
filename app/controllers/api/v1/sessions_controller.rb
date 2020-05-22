class SessionsController < ApplicationController 

    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            render json: {
                status: 200,
                user: @user
            }
             else
            render json: { 
                status: 401,
                errors: ['no such user', 'verify credentials and try again or signup']
            }
        end
    end

    
end