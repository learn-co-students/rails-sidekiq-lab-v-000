class SongsWorker
	require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
  	CSV.foreach(songs_file, headers: true) do |file|
      song = Song.create(title: file[0])
      song.artist = file[1]
    end
    # redirect_to songs_path
  end

end