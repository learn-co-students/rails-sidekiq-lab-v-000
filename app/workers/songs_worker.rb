class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(*args)
  	CSV.foreach(*args, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end
end
