require "transaction"

class Statement
  def initialize(transaction_class = Transaction)
    @transactions = []
    @transaction_class = transaction_class
  end

  def add_transaction(date, credit, debit, balance)
    @transactions << @transaction_class.new(date, credit, debit, balance)
  end

  def format_transactions
    @transactions.each do |transaction|

    end
  end
end
