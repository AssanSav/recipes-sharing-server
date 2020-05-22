class Api::SessionsController < ApplicationController 

    def create
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

    def is_logged_in?
        if !!session[:user_id] && current_user
            render json: {
                logged_in: true,
                user: current_user
            }
        else 
            render json: {
                logged_in: false,
                message: 'no such user'
            }
        end
    end

    def destroy
        @user = User.find(session[:user_id])
        if @user 
            session.clear 
            render json: {
                status: 200,
                logout: true
            }
        end
    end
end
