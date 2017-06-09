class SongsWorker
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(leads_file, headers: true) do |imported_song|
      song = Song.create(title: imported_song[0])
      artist = Artist.find_or_create_by(name: imported_song[1])
      song.artist_id = artist.id
      song.save
    end
  end
end
