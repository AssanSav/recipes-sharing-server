class Api::SessionsController < ApplicationController 

    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: {
          status: 200,
          user: UserSerializer.new(user)
        }
      elsif user 
        render json: {
          status: 500,
          passwordError: ["*Wrong Password!"],
        }
      else
          render json: {
          status: 500,
          email_error: ["*Email Not Found!"]
        }
      end
    end

    def is_logged_in?
        if !!session[:user_id] && current_user
            render json: {
                logged_in: true,
                user: UserSerializer.new(current_user)
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
