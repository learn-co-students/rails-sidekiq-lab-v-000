class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(file_file)
    CSV.foreach(file_file, headers: true) do |f|
      Song.create(email: f[0], artist_name: f[1])
    end
  end
end
