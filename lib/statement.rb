require "transaction"

class Statement
  TITLE = "date || credit || debit || balance"

  def initialize(transaction_class = Transaction)
    @transactions = []
    @transaction_class = transaction_class
  end

  def add_transaction(date, credit, debit, balance)
    @transactions << @transaction_class.new(date, credit, debit, balance)
  end

  def format_transactions
    TITLE + "\n" + @transactions.map { |transaction| transaction.format }.reverse.join("\n")
  end
end
