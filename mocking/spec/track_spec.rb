require "track"

RSpec.describe Track do
    it "returns track if artist matches keyword" do
        track = Track.new("beatles", "come togther")
        expect(track.matches?("beatles")).to eq true
    end

    it "returns true if title matches keyword" do
        track = track = Track.new("sum41", "in too deep")
        expect(track.matches?("deep")).to eq true
    end

    it "returns false if title doesn't match keyword" do
        track = track = Track.new("sum41", "in too deep")
        expect(track.matches?("help")).to eq false
    end

    it "returns false if artist doesn't match keyword" do
        track = track = Track.new("sum41", "in too deep")
        expect(track.matches?("help")).to eq false
    end

end