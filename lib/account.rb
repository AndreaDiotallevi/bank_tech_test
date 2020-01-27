class Account
  attr_reader :balance
  
  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @statement.add_transaction(Date.today, amount, 0, @balance + amount)
    @balance += amount
  end

  def withdraw(amount)
    fail "You don't have enough balance" unless @balance - amount >= 0
    
    @balance -= amount
  end

  def print_statement
    @statement.format_transactions
  end
end
