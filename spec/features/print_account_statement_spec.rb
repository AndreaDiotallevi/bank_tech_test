require "account"

describe "a user can print its account statement" do
  it "should return a formatted table with transactions in reverse chronological order" do
    allow(Date).to receive(:today).and_return Date.new(2012, 1, 10)
    account = Account.new
    account.deposit(1000)
    account.withdraw(500)

    transaction1 = "10/01/2012 || 1000.00 || || 1000.00"
    transaction2 = "10/01/2012 || || 500.00 || 500.00"
    expect { account.print_statement }.to output("#{Statement::TITLE}\n#{transaction2}\n#{transaction1}").to_stdout
  end
end
