class SongsController < ApplicationController

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

  def upload # The #upload action (method) of SongsController will run SongsWorker to upload and process the db/songs.csv CSV file instead of processing this file inline here
    SongsWorker.perform_async(params[:file].path) # the argument is the path to the CSV file
    redirect_to songs_path # The user is immediately redirected to songs index page b/c the request/response is on the main web application thread, whereas the blocking task (uploading and processing the CSV file) is on a background thread
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
