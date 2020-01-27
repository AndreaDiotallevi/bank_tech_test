require "account"

describe Account do
  let(:account) { Account.new }

  describe "#deposit" do
    it "should return 1 after a deposit of 1" do
      expect(account.deposit(1)).to eq 1
    end
  end
end
