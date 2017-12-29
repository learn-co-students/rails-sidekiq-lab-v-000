class SongsWorker
  include Sidekiq::Worker
  require 'csv'

  def perform(file)
    CSV.foreach(file, headers: true) do |lead|
      Song.create(title: lead[0], artist_name: lead[1])
    end
  end
end
