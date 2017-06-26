class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |s|
      Song.create(title: s[0], artist_name: s[1])
    end
  end
end
