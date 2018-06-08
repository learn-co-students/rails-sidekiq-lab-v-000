class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
Song.create(title: song[0], artist: song[1], string: song[2])
  end
end

end

