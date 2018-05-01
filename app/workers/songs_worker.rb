class SongsWorker
  require 'csv'
  include Sidekiq::Worker
 
  def perform(songs_file)
 	CSV.foreach(songs_file, headers: true) do |song|
 	  # artist = Artist.find_or_create_by(:name => song[1])
      Song.create(name: song[0], artist_name: song[1])
    end
  end
end