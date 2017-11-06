class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs)
    CSV.foreach(songs, headers: true) do |lead|
    Song.create(title: songs[0])
  end
end

end
