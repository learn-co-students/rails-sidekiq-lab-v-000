class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song_row|
      Song.create(title: song_row[0], artist_name: song_row[1])
    end
  end
end
