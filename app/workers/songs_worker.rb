class SongsWorker
  require 'csv'
  include SideKiq::Worker

  def perform(songs_file)
    CSV.foreach(params[:file].path, headers: true) do |s|
      Song.create(title: s[0], artist_name: s[1])
    end
  end
end