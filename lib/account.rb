class Account
  attr_reader :balance
  
  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    fail "You don't have enough balance" unless @balance - amount >= 0
    
    @balance -= amount
  end
end
