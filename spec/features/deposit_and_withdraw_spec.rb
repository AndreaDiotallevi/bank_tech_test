require "account"

describe "a user can deposit and withdraw from his account" do
  it "should return 1 if the user deposits 2 and withdraws 1" do
    account = Account.new
    account.deposit(2)
    account.withdraw(1)
    expect(account.balance).to eq 1
  end
end
