class SongsWorker
  require 'csv'
  include Sidekiq::Worker 

  def performer(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      Song.create(title: lead[0], artist_name: lead[1])
    end
  end
end
