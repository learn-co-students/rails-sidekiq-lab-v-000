
class SongsWorker
  require 'csv'
  include Sidekiq::Worker


  def perform(song_file)
    CSV.foreach(song_file, headers: true) do |f|
      Song.create(title: f[0], artist_name: f[1])
    end
  end
end
