class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end

  def self.clear_songs
    Song.destroy_all
  end

end