require "account"

describe "a user can print its account statement" do
  it "should return a formatted table with transactions in reverse chronological order" do
    account = Account.new

    deposit1_time = Time.local(2012, 1, 10, 1, 1, 1)
    Timecop.freeze(deposit1_time)
    account.deposit(1000)

    deposit2_time = Time.local(2012, 1, 13, 1, 1, 1)
    Timecop.freeze(deposit2_time)
    account.deposit(2000)

    withdrawal_time = Time.local(2012, 1, 14, 1, 1, 1)
    Timecop.freeze(withdrawal_time)
    account.withdraw(500)

    transaction1 = "10/01/2012 || 1000.00 || || 1000.00"
    transaction2 = "13/01/2012 || 2000.00 || || 3000.00"
    transaction3 = "14/01/2012 || || 500.00 || 2500.00"
    expect { account.print_statement }.to output("#{Statement::TITLE}\n#{transaction3}\n#{transaction2}\n#{transaction1}").to_stdout
  end
end
