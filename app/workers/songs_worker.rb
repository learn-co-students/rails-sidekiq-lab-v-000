class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(file)
    CSV.foreach(file, headers: true) do |song|
      Artist.find_or_create_by(name: song[1])
      artist.songs.build(title: song[0])
      artist.save
    end
  end
end
