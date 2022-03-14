require "contact"

RSpec.describe Contact do
    context "it creates a phone contact" do
        it "creates a phone contact storing the name and number" do
            contact = Contact.new("Brad", "0798245361")
            expect(contact.number).to eq "Brad: 0798245361"
        end
    end
end