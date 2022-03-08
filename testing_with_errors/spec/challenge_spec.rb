require "challenge"

RSpec.describe PasswordChecker do
    it "returns true if password length is greater than or equal to 8" do
        password = PasswordChecker.new
        expect(password.check("resdsdeww")).to eq true
    end

    context "when password length is less than 8" do
        it "fails" do
            password = PasswordChecker.new
            expect { password.check('redf') }.to raise_error "Invalid password, must be 8+ characters."
        end
    end
end