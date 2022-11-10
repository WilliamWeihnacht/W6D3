# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
    puts 'Destroying tables...'
    User.destroy_all
    Artwork.destroy_all
    ArtworkShare.destroy_all

    puts 'Resetting id sequences...'
    %w(users artworks artwork_shares).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end
    
    users = User.create( [
                        {username: "WillW"}, 
                        {username: "Rex"}, 
                        {username: "Jerry"},
                        {username: "John"}
                    ])
                    
    artworks = Artwork.create ([
                        {title: "Shrek", image_url: "itsishere", artist_id: 1},
                        {title: "CokeCan", image_url: "iloveCOC", artist_id: 2},
                        {title: "Women", image_url: "inappropiatewebsite", artist_id: 3},
                        {title: "Men", image_url: "thehub", artist_id: 3},
                        {title: "Shrooms", image_url: "OaklandChurch", artist_id: 4},
    ])

    artworkshares = ArtworkShare.create ([
                        {artwork_id: 1, viewer_id: 2},
                        {artwork_id: 1, viewer_id: 3},
                        {artwork_id: 2, viewer_id: 1},
                        {artwork_id: 4, viewer_id: 2}


    ])

end



