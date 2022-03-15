require "music_library"

RSpec.describe MusicLibrary do

    it "adds and returns a list of tracks" do
        library = MusicLibrary.new
        track1 = double :track
        track2 = double :track
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
        track1 = double :track, matches?: true
        track2 = double :track, matches?: true
        library.add(track1)
        library.add(track2)
        expect(library.search("two")).to eq [track1, track2]
    end

    it "returns track if it matches keyword" do
        library = MusicLibrary.new
        track1 = double :track, matches?: true
        track2 = double :track, matches?: false
        library.add(track1)
        library.add(track2)
        expect(library.search("two")).to eq [track1]
    end
end