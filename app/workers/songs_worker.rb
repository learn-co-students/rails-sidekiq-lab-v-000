class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(leads_file)
    CSV.foreach(leads_file, headers: true) do |file|
      Song.create(title: lead[0], artist_name: song[1])
    end
  end
end
