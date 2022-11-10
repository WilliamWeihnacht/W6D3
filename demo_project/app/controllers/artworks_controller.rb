class ArtworksController < ApplicationController

    def index

        render json: Artwork.all
        
    end

    def update
       art = Artwork.find_by(id: params[:id])
        if art.update(user_params)
            redirect_to artwork_url(params[:id])
        else
            render json: art.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: Artwork.find_by(id: params[:id])
    end

    def create
        art = Artwork.new(art_params)
        if art.save
            render json: art
        else
            render json: art.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        art = Artwork.find_by(id: params[:id])
        art.destroy!
        render json: art
    end

    private
    def art_params
        params.require(:art).permit(:title, :image_url, :artist_id)
    end
end