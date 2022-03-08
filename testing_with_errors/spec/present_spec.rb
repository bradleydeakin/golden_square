require "present"

RSpec.describe Present do
    it "wraps and unwraps a value" do
        present = Present.new
        expect(present.wrap(6)).to eq 6
        expect(present.unwrap).to eq 6
    end

    context "When contents have already been wrapped" do
        it "fails" do
            presents = Present.new
            presents.wrap(5)
            expect { presents.wrap(6) }.to raise_error "A contents has already been wrapped."
        end
    end

    context "when contents have not been wrapped" do
        it "fails" do
            present = Present.new
            expect{ present.unwrap }.to raise_error "No contents have been wrapped."
        end
    end
end

            