class SongsWorker
require 'csv'
include Sidekiq::Worker 

  def perform(upload_file)
    CSV.foreach(upload_file, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
    redirect_to songs_path
  end


end