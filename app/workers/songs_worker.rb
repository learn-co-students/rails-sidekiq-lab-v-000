class SongsWorker
  require 'csv'
  include Sidekiq::Worker
 
  def perform(file)
    CSV.foreach(file, headers: true) do |song|
      Song.create(title: file[0], artist_name: file[1])
    end
  end
end