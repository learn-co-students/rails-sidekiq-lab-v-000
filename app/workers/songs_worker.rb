class SongsWorker
	require 'csv'
	include Sidekiq::Worker
	def perform(songs)
		CSV.foreach(songs, headers: true) do |row|
			Song.create(title: row[0], artist_name: row[1])
		end
	end
end