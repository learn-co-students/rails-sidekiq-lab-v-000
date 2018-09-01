class SongsWorker
  require 'csv'
  include Sidekiq::Worker
  def perform(leads_file)
    CSV.foreach(leads_file, headers: true) do |lead|
      Artist.create(name: lead[1], title: lead[0])
  end
end
end
