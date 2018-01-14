class SongsWorker
  require 'csv'
  include Sidekiq::Worker
 
  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      Customer.create(title: song[0], artist: song[1], last_name: lead[2])
    end
  end
end