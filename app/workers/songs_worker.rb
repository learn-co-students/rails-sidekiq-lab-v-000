class SongsWorker
  require 'csv'
  include Sidekiq::Worker
 
  def perform(leads_file)
    CSV.foreach(leads_file, headers: true) do |lead|
      song = Song.create(title: lead[0])
      song.artist_name = lead[1]
      song.save
    end
  end
end
