class SongsWorker
  require 'csv'
  include Sidekiq::Worker 


  def perform(new_file)
    CSV.foreach(new_file, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end

end