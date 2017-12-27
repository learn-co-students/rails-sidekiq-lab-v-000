class SongsWorker
    include Sidekiq::Worker

    def perform(songs_file)
        CSV.foreach(songs_file.path, headers: true) do |song|
            artist = Artist.find_or_create_by(name: song[1])
            artist.songs.build(title: song[0])
            artist.save
        end
    end
end