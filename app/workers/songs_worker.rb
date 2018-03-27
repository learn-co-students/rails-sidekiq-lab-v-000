class SongsWorker
  require 'csv'
  include Sidekiq::Worker
  
  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |file|
      artist = Artist.find_or_create_by(name: file[1])
      artist.songs.create(title: file[0]) 
    end
  end

end  # end of class