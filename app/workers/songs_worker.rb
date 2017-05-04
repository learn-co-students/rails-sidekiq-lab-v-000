class SongsWorker
  require 'csv'

  include Sidekiq::Worker

  def perform(file)
    CSV.foreach(file, headers: true) do |f|
      artist = Artist.create_or_find_by(name: f[1])
      Song.create(title: f[0], artist_id: artist.id)
    end
  end

end
