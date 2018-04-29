class SongsWorker
  include Sidekiq::Worker
  require 'csv'

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |file|
    Song.create(title: file[0], artist: file[1])
    end
  end

end
