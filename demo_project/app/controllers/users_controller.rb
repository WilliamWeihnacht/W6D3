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
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

end