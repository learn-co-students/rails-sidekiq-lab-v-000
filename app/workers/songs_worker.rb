class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)

  end
end
