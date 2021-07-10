class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(file_upload)
    CSV.foreach(file_upload, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end
end
