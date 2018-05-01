class SongsController < ApplicationController
  require 'csv'

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def upload
   # Below is what gets passed into my params hash.
   #    => #<Rack::Test::UploadedFile:0x007fa23d1bfa80
   # @content_type="text/csv",
   # @original_filename="songs.csv",
   # @tempfile=
   #  #<File:/var/folders/85/8z627c5x4zg_51bgnn6123z80000gn/T/songs.csv20180501-90162-1mpyz64>>

    SongsWorker.perform_async(params[:file].path)
    redirect_to songs_path
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
