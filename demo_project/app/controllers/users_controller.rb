class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def update
       user = User.find_by(id: params[:id])
        if user.update(user_params)
            redirect_to user_url(params[:id])
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
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

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy!
        render json: user
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end

end