class SongsWorker
	require 'csv'
  	include Sidekiq::Worker
 
  	def perform(leads_file)
    CSV.foreach(leads_file, headers: true) do |lead|
      Songs.create(song: lead[0], artist: lead[1], release_year: lead[2], combined: lead[3], playcount: lead[4])
    end
  end
end