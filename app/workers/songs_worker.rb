class SongsWorker
    include Sidekiq::Worker
    def perform(name)
        CSV.foreach(name, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1])
    end
    end
end