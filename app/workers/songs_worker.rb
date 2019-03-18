class SongsWorker
  require 'csv'
<<<<<<< HEAD

  include Sidekiq::Worker

  def perform(file)
    CSV.foreach(file, headers: true) do |song|
      Song.create(title: song[0])
    end
  end
end
=======
  
  include Sidekiq::Worker
 
  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      Song.create(title: song[0], artist_name: song[1]
    end
  end
  
end
>>>>>>> 7ed0e5db73224a012cb95310401b83431778ef7f
