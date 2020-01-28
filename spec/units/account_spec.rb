require "account"

describe Account do
  let(:statement) { double(:statement, add_transaction: nil, format_transactions: "date || credit || debit || balance\n10/01/2012 || || 500.00 || 500.00\n10/01/2012 || 1000.00 || || 1000.00") }
  let(:account) { Account.new(statement) }

  describe "#balance" do
    it "should return an initial balance of 0" do
      expect(account.balance).to eq 0
    end
  end

  describe "#deposit" do
    it "should return the updated balance of 1 after a deposit of 1" do
      expect(account.deposit(1)).to eq 1
    end
  end

  describe "#withdraw" do
    it "should return the updated balance of 0 after a withdrawal of 1 from a balance of 1" do
      account.deposit(1)
      expect(account.withdraw(1)).to eq 0
    end

    it "should raise an error if the user tries to withdraw more money than the actual balance" do
      expect { account.withdraw(1) }.to raise_error "You don't have enough balance"
    end
  end

  describe "#print_statement" do
    it "should print a formatted table with transactions date, credit, debit and balance, in reverse chronological order" do
      account.deposit(1000)
      account.withdraw(500)
      expect { account.print_statement }.to output("date || credit || debit || balance\n10/01/2012 || || 500.00 || 500.00\n10/01/2012 || 1000.00 || || 1000.00").to_stdout
    end
  end
end
