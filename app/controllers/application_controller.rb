class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def upload()
    SongsWorker.perform_async(params[:file].path)
    redirect_to songs_path
  end 
end
