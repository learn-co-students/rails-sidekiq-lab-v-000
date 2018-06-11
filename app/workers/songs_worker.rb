class SongsWorker
  include Sidekiq::Worker
  def perform(song_upload_path)
    CSV.foreach(song_upload_path, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end
end
