class SongsWorker
	require 'csv'
	include Sidekiq::Worker

	def perform(csv_file)
		CSV.foreach(csv_file, headers: true) do |song|
			song = Song.create(title: song[0], artist_name: song[1])
		end
	end
end