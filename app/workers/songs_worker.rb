class SongsWorker
    require 'csv'
    include Sidekiq::Worker
    
    def perform(songs_file)
        CSV.foreach(songs_file, headers: true) do |song|
            artist = Artist.create(:name => song[1])
            Song.create(:title => song[0], :artist_id => artist.id)
        end
    end
end
