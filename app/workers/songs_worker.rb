class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(file)
    CSV.foreach(file, headers: true) do |song|
      Song.new(title: song[0], artist: Artist.find_or_create_by(name: song[1]))
  end
end

end
