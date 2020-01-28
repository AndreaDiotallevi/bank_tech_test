class Transaction
  def initialize(credit, debit, balance, time_class = Time)
    @credit = credit
    @debit = debit
    @balance = balance
    @date = time_class.new
  end

  def format
    credit = format_decimals(@credit)
    debit = format_decimals(@debit)
    balance = format_decimals(@balance)
    [format_date, credit, debit, balance].join(" || ").gsub(" 0.00 ", " ")
  end

  private

  def format_date
    @date.strftime("%d/%m/%Y")
  end

  def format_decimals(amount)
    sprintf('%.2f', amount)
  end
end
