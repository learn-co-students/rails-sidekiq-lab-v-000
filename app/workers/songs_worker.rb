class SongsWorker
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |lead|
      @artist = Artist.create_or_find_by(name: lead[1])
      Song.create(title: lead[0], artist_id: @artist.id)
    end
  end

end
