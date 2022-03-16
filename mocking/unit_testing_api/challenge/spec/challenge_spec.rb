require "challenge"
require "net/http"

RSpec.describe CatFacts do
    it "returns a cat fact" do
        fake_facts = double :facts
        expect(fake_facts).to receive(:get).with(URI("https://catfact.ninja/fact"))
        .and_return('{"fact":"Cats step with both left legs, then both right legs when they walk or run.","length":74}')
        cat_fact = CatFacts.new(fake_facts)
        expect(cat_fact.provide).to eq "Cat fact: Cats step with both left legs, then both right legs when they walk or run."
    end

end