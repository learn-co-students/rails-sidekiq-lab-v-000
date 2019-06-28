class SongsWorker
  require 'csv'
  include Sidekiq::Worker
 
  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
        new_artist = Artist.find_or_create_by(name: song[1])
        new_song = Song.create(title: song[0])
        new_song.artist = new_artist
        new_song.save
    end
  end
end