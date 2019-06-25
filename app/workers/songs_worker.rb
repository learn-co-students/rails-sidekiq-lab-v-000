class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(leads_file)
    CSV.foreach(leads_file, headers: true) do |lead|
      Customer.create(song: lead[0], artist_name: lead[1])
    end
  end
end
