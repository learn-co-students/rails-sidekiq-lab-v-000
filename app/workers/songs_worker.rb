class SongsWorker
  require 'csv'

  include Sidekiq::Worker

  def perform(file)
    binding.pry
    CSV.foreach(file, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
  end
end
