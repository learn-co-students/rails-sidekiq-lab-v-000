class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      @song = Song.new(title: song[0])
      @song.artist = Artist.find_or_create_by(name: song[1])
      @song.save
    end
  end
end