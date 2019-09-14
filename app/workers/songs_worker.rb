class SongsWorker
    require 'csv'
    include Sidekiq::Worker
   
    def perform(songs_file)
        CSV.foreach(songs_file, headers: true) do |song|
          Song.create(title: song[0], artist_name: song[1])
        end
    end
  end

  



 # def perform(leads_file)
  #  CSV.foreach(leads_file, headers: true) do |lead|
   #   Customer.create(email: lead[0], first_name: lead[1], last_name: lead[2])
   # end
  #end


 # CSV.foreach(params["file"].path, headers: true) do |song|
  #  Song.create(title: song[0], artist_name: song[1])
  #end