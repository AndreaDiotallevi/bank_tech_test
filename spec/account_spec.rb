require "account"

describe Account do
  let(:account) { Account.new }

  describe "#deposit" do
    it "should return 1 after a deposit of 1" do
      expect(account.deposit(1)).to eq 1
    end
  end

  describe "#withdraw" do
    it "should return 0 after a withdrawal of 1 from a balance of 1" do
      account.deposit(1)
      expect(account.withdraw(1)).to eq 0
    end
  end
end
