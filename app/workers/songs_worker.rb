class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(file)
    CSV.foreach(file, headers: true) do |song|
      artist = Artist.find_or_create_by(name: song[1])
      Song.create(title: song[0], created_at: song[2], artist_id: song[1])
    end
  end

end
