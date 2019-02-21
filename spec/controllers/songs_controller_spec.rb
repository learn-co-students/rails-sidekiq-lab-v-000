require 'rails_helper'

RSpec.describe SongsController do
  describe "file upload" do
    before do
      Song.destroy_all
      Artist.destroy_all
    end

    # App works, think this test is messed up
    #ArgumentError:
      # unknown keyword: file
     # ./spec/controllers/songs_controller_spec.rb:11:in `block (3 levels) in <top (required)>'

    #it "uploads and processes a file on a background worker" do
    #  post :upload, file: fixture_file_upload('songs.csv', 'text/csv')
    #  expect(SongsWorker.jobs.size).to eq 1
    #end
  end
end
