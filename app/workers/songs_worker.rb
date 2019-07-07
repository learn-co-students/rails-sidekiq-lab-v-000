class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(params["file"].path, headers: true) do |song|
      Song.create(title: song[0])
      Artist.find_or_create(name: song[1])
    end
  end
end
