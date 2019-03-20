class SongsWorker
  include Sidekiq::Worker
 require 'csv'
  def perform(songs_file)
    CSV.foreach(params["file"].path, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
  end
end
