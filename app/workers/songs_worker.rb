class SongsWorker 
	include Sidekiq::Worker
	require 'csv'

	def perform(file)
		CSV.foreach(file, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
	end
end
