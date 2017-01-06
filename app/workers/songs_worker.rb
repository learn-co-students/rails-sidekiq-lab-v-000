class SongsWorker
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |file|
      artist = Artist.find_or_create_by(name: file[1])
      Song.create(title: file[0], artist: artist, artist_name: file[1])
    end
  end

end
