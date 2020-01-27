require "account"
require "date"

describe "a user can print its account statement" do
  it "should return a nice formatted table with date, credit, debit and balance in reverse chronological order" do
    allow(Date).to receive(:today).and_return Date.new(2012, 1, 10)
    account = Account.new
    account.deposit(1000)
    account.deposit(1000)
    account.withdraw(500)

    title = "date || credit || debit || balance"
    transaction1 = "10/01/2012 || 1000.00 || || 1000.00"
    transaction2 = "10/01/2012 || 1000.00 || || 1000.00"
    transaction3 = "10/01/2012 || || 500.00 || 1000.00"
    expect(account.print_statement).to eq "#{title}\n#{transaction3}\n#{transaction2}\n#{transaction1}"
  end
end
