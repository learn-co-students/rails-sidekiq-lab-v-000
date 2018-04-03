# Sidekiq relies on a Worker to define and process a job; added in app/workers 
class SongsWorker
 require 'csv' # a complete interface to CSV files and data

 include Sidekiq::Worker

 def perform(songs_file)
 	# long-running code
 	CSV.foreach(songs_file, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
 end
end