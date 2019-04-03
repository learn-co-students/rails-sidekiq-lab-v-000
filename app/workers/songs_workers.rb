class SongsWorker
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      new_song = Song.create({title: song[0]})
      artist = nil
      if Artist.where(name: song[1]).empty?
         artist = Artist.create!({name: song[1]})
         artist.save!
      else
         artist = Artist.find_by(name: song[1])
      end
      new_song.artist = artist
      new_song.save!
    end
  end
end
