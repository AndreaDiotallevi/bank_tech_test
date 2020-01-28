class Account
  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def current_balance
    @balance
  end

  def deposit(amount)
    @statement.add_transaction(amount, 0, @balance + amount)
    @balance += amount
  end

  def withdraw(amount)
    fail "You don't have enough balance" unless @balance - amount >= 0
    
    @statement.add_transaction(0, amount, @balance - amount)
    @balance -= amount
  end

  def print_statement
    print @statement.format_transactions
  end
end
