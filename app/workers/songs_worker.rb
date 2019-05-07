class SongsWorker
  include Sidekiq::Worker

  def perform(song_list)
    require 'csv'

    CSV.foreach(song_list, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end
end
