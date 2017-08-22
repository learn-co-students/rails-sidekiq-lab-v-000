class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform (songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      Customer.create(song_title: song[0], artist_name: song[1], released_year: song[2])
    end
  end
end
