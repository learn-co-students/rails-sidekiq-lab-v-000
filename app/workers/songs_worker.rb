class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(files)
     CSV.foreach(files, headers: true) do |file|
       Song.create(title: file[0], artist_name: file[1])
     end
  end
end
