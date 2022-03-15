require "music_library"
require "track"

RSpec.describe MusicLibrary do

    it "adds and returns a list of tracks" do
        library = MusicLibrary.new
        track1 = Track.new("sum41", "in too deep")
        track2 = Track.new("beatles", "come togther")
        library.add(track1)
        library.add(track2)
        expect(library.all).to eq [track1, track2]
    end

    it "returns [] if library is empty" do
        library = MusicLibrary.new
        expect(library.all).to eq []
    end

    it "returns all tracks if they match keyword" do
        library = MusicLibrary.new
        track1 = Track.new("linkin park", "what i've done")
        track2 = Track.new("blink 182", "whats my age again")
        library.add(track1)
        library.add(track2)
        expect(library.search("what")).to eq [track1, track2]
    end

    it "returns track if it matches keyword" do
        library = MusicLibrary.new
        track1 = Track.new("linkin park", "what i've done")
        track2 = Track.new("blink 182", "whats my age again")
        library.add(track1)
        library.add(track2)
        expect(library.search("done")).to eq [track1]
    end
end