class SongsWorker
	require 'csv'
	include Sidekiq::Worker 

	def perform(file)
		CSV.foreach(file, headers: true) do |song|
			Song.create(title: song[0], artist_id: Artist.find_or_create_by(name: song[1]).id)
		end
	end
end

