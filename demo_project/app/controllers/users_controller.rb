class UsersController < ApplicationController

    def index
        render plain: "I'm in the index action!"
    end

    def update
        
    end

    def show
        render json: User.find_by(id: params[:id])
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end

end