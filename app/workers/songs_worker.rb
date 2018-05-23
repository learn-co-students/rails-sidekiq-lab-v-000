class SongsWorker
    include Sidekiq::Worker

    def perform(songs_file)
        CSV.foreach(songs_file, headers: true) do |song|
            Song.create(song: song[0], artist: song[1])
        end
    end
end