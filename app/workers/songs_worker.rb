class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_db)
    CSV.foreach(songs_db, headers: true) do |song_info|
      new_song = Song.create(title: song_info[0], artist_name: song_info[1])
    end
  end

end
