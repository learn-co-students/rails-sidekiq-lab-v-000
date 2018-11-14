class SongsWorker
  require 'csv'
  include Sidekiq::Worker
 
  def jobs(songs_file)
    CSV.foreach(songs_file, headers: true) do |input|
      Song.create(title: input[0], artist_name: input[1])
    end
  end
end
