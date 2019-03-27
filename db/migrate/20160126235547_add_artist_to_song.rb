class AddArtistToSong < ActiveRecord::Migration[4.2]
  def change
    add_reference :songs, :artist, index: true, foreign_key: true
  end
end
