class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(music_file)
    CSV.foreach(music_file, headers: true) do |song|
      song = Song.find_or_create_by(title: song[0])
      song.artist = Artist.find_or_create_by(name: song[1])
    end
  end
end
