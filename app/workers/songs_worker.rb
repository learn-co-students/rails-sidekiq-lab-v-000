class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |songs|
      Song.create(title: songs[0], artist_name: songs[1])
    end
  end
end
