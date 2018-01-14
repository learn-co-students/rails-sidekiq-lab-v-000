class SongsWorker
  include Sidekiq::Worker
  require 'csv'

  def perform(songs_file)
    CSV.foreach(songs_file, headers:true) do |info|
      file_artist = Artist.find_or_create_by(name: info[1])
      Song.find_or_create_by(title: info[0], artist_id: file_artist.id)
    end
  end
end