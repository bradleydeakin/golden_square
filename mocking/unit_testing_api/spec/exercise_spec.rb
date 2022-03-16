require "exercise"
require 'date'
require 'net/http'

RSpec.describe TimeError do
    it "returns the difference in seconds between server and computer" do
        fake_requester = double :requester
        expect(fake_requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip"))
        .and_return('{"abbreviation":"GMT","client_ip":"2a02:c7d:1e1f:2400:619c:34a:7cd6:efbb","datetime":"2022-03-16T11:00:42.038278+00:00","day_of_week":3,"day_of_year":75,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1647428442,"utc_datetime":"2022-03-16T11:00:42.038278+00:00","utc_offset":"+00:00","week_number":11}')

        time_error = TimeError.new(fake_requester)
        time = Time.new(2022, 3, 16, 11, 2, 0)
        expect(time_error.error(time)).to eq -77.961722
    end

end