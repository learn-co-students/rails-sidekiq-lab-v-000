class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(title)
    CSV.foreach(params["file"].path, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end
end
