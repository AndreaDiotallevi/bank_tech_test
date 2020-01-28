require "account"

describe "a user can deposit and withdraw from his account" do
  it "should return a balance of 1 if the user deposits 2 and withdraws 1" do
    account = Account.new
    account.deposit(2)
    account.withdraw(1)
    expect(account.balance).to eq 1
  end
end

describe "a user cannot withdraw more money than the actual balance" do
  it "should raise an error if the user deposit 1 and withdraws 2" do
    account = Account.new
    account.deposit(1)
    expect { account.withdraw(2) }.to raise_error "You don't have enough balance"
  end
end
