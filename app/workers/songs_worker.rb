class SongsWorker
  require 'csv'
  include Sidekiq::Worker
  
  def perform(file)
    CSV.foreach(file, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end

  def perform(songs_file)
   CSV.foreach(songs_file, headers: true) do |lead|
     Customer.create(title: lead[0], artist_name: lead[1])
   end
 end

end
