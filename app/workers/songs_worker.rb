class SongsWorker
  require 'csv'
  include SideKiq::Worker
  def perform(songs_file)
    # TODO
    # Song.create()
  end
end