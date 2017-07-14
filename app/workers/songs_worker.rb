class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(import_file)
    CSV.foreach(import_file, headers: true) do |line|
      Song.create(name: import_file[0], author_name: import_file[1])
    end
  end
end
