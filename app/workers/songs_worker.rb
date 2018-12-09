class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    # CSV.foreach(songs_file, headers: true) do |song|
    #   @artist = Artist.find_or_create_by(name: song[1])
    #   @song = Song.create(title: song[0], artist_id: @artist.id)

       CSV.foreach(songs_file, headers: true) do |song_info| 
          new_song = Song.create(title: song_info[0], artist_name: song_info[1]) 

    end
  end
end
